Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 346E01B1A6
	for <lists+dm-devel@lfdr.de>; Mon, 13 May 2019 10:01:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A81DB37E79;
	Mon, 13 May 2019 08:01:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0668963BB1;
	Mon, 13 May 2019 08:01:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FC3641F58;
	Mon, 13 May 2019 08:01:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4AHnBhX020234 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 May 2019 13:49:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29ED45D723; Fri, 10 May 2019 17:49:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D7FF5D720;
	Fri, 10 May 2019 17:49:00 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8E82E1F0A;
	Fri, 10 May 2019 17:48:58 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id t87so3615162pfa.2;
	Fri, 10 May 2019 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ba+OFE4wADrqdhyYH6+TIYWIg/S9KnHVbFH0H13zsEg=;
	b=MYU3pZEgiE53ih3bb0zbEGz+f5/4taT4mmqyua+dSsI9A16rySGYyjdg9ci4hbJpAM
	QUUttqrVlyCKnw0P34ySrxBWOB7Bi7I+g5B/9oXrEtXsJNqY/q1KBYNqkcUtzz3OL+qf
	moK+LezPCtDLkAYk7pYS+c1AK0OJ9oR2RMTshTt+tjNhlAGAwZgFuezi5XIOB9TM9tNB
	pAxGjtKhRrzYgxPxzds2J+hfaR105cyEIz92pZ3jJFOA1db22p9S5T+A2kAXuIxB1pyO
	7TM6ts2jql68cfFdbGTkaYA0wWioqXQiD18m3nE+A+A1A4xvKT1Cokm05MWLC2otpDH2
	S6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ba+OFE4wADrqdhyYH6+TIYWIg/S9KnHVbFH0H13zsEg=;
	b=QESnrkBMNb9nWwtjrIopWwDHG0daeYciGrWnYfyOl16Ad81MZAZVHpWUwNmM6SFl/V
	uVfVG3IYM4MgLL0OXaHgWIbJN8buLx0TIndT+orr0lHMPtsWwS04e3eLBtadWGXd7qE6
	5VFMvKWBOlPXLibone7YJYQKZWyMoIgLvDwJKrAnnBfioJctY4c80RR0Qswy1CsWr2rU
	W/NcxZqv6Vzb58Rhr84gGPAh/vN1XlUGeN8TKs1oRgz75tcdCBN800apVPQKHD+PQwKY
	LdOSuiYqd4M3uz589KGjpV1H/0XwiumGMSASelg8V+apdnbIWfeP8tgSXejUUZi2+2s+
	os3A==
X-Gm-Message-State: APjAAAVdVJeKN5nJUDpE4SBCLGLtzC0CIuxwAc3eKkyAMI9j/DuZcX9v
	0LX6i8QPFmVErlqLfzUfD+4=
X-Google-Smtp-Source: APXvYqzksanKEkJoZ5Q6d4CvQ+jWvY2Zb9lvhIBTJpeove44FZfS+5UbdAAPI2GxU0pWVaSkyEVd9A==
X-Received: by 2002:a63:61cf:: with SMTP id v198mr15550958pgb.29.1557510538143;
	Fri, 10 May 2019 10:48:58 -0700 (PDT)
Received: from localhost.localdomain ([183.82.23.62])
	by smtp.googlemail.com with ESMTPSA id
	n64sm12323447pfb.38.2019.05.10.10.48.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 10:48:57 -0700 (PDT)
From: Sheetal <2396sheetal@gmail.com>
To: 
Date: Fri, 10 May 2019 23:18:37 +0530
Message-Id: <20190510174838.1968-1-2396sheetal@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 10 May 2019 17:48:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Fri, 10 May 2019 17:48:59 +0000 (UTC) for IP:'209.85.210.196'
	DOMAIN:'mail-pf1-f196.google.com'
	HELO:'mail-pf1-f196.google.com' FROM:'2396sheetal@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.445  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, FROM_STARTS_WITH_NUMS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_PASS) 209.85.210.196 mail-pf1-f196.google.com 209.85.210.196
	mail-pf1-f196.google.com <2396sheetal@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 13 May 2019 04:00:53 -0400
Cc: Mike Snitzer <snitzer@redhat.com>, person@a.com,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	Sheetal <2396sheetal@gmail.com>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH] md : dm: Fixed a brace coding style issue
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 13 May 2019 08:01:28 +0000 (UTC)

Fixed a coding style issue.
---
 drivers/md/dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 043f0761e4a0..2a8820bd581d 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -781,7 +781,8 @@ static void close_table_device(struct table_device *td, struct mapped_device *md
 }
 
 static struct table_device *find_table_device(struct list_head *l, dev_t dev,
-					      fmode_t mode) {
+					      fmode_t mode)
+{
 	struct table_device *td;
 
 	list_for_each_entry(td, l, list)
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
