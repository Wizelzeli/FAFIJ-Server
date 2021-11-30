package fafij.server.repository;
import fafij.server.entity.Category;
import fafij.server.entity.Journal;
import fafij.server.entity.Note;
import fafij.server.service.CategoryRepository;
import fafij.server.service.JournalRepository;
import fafij.server.service.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class NoteService {
    @Autowired
    private final NoteRepository noteRepository;
    @Autowired
    private JournalRepository journalRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    public NoteService(NoteRepository noteRepository){
        this.noteRepository = noteRepository;
    }

    public void createNote(String date, Long sum, String category, String comment, String journal) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        Date dates = format.parse(date);
        Note note = new Note();
        note.setDate(dates);
        note.setSum(sum);
        note.setIdCtgr(categoryRepository.findByNameAndIdJournal(category, journalRepository.findByName(journal)));
        note.setComment(comment);
        note.setIdJournal(journalRepository.findByName(journal));
        noteRepository.save(note);
    }
    public void deleteNote(Long note) {
        Optional<Note> n = noteRepository.findById(note);
        Note nn = n.get();
        noteRepository.delete(nn);
    }

    public void updateNote(Long id, String date, Long sum, String category, String comment) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        Date dates = format.parse(date);
        Note note = noteRepository.findById(id).get();
        note.setDate(dates);
        note.setSum(sum);
        note.setIdCtgr(categoryRepository.findByName(category));
        note.setComment(comment);
        noteRepository.save(note);
    }

    public List<Note> findAllByCategory(Category category){
        return noteRepository.findAllByIdCtgr(category);
    }
    public Optional<Note> findById(Long id){
        return noteRepository.findById(id);
    }

    public List<Note> findAllByJournal(String journal){
        return noteRepository.findAllByIdJournal(journalRepository.findByName(journal));
    }

    public List<Note> findAllByIdJournalOrderByDate(String journalName){
        return noteRepository.findAllByIdJournalOrderByDate(journalRepository.findByName(journalName));
    }
}
