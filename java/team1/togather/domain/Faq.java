package team1.togather.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Faq {

  private long fseq;
  private String ftitle;
  private String fcontent;

  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd (E) HH:mm")
  private Date rdate;
}
