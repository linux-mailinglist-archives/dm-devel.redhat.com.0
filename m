Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F46206D3
	for <lists+dm-devel@lfdr.de>; Thu, 16 May 2019 14:23:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB900120D7;
	Thu, 16 May 2019 12:23:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63DB518439;
	Thu, 16 May 2019 12:23:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB119206D2;
	Thu, 16 May 2019 12:23:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GBt0Ud015029 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 07:55:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 620A87855C; Thu, 16 May 2019 11:55:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 583641820D;
	Thu, 16 May 2019 11:54:51 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4AF881E14;
	Thu, 16 May 2019 11:54:50 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id z5so2804692lji.10;
	Thu, 16 May 2019 04:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=CmnZfumF9iiGQAirSQFGi3SQU9LgHj3goRRvWShE7o4=;
	b=qr3M6xd9LDhWCeZzivxqRc2IAcKvuqGXYSv5qp4PSZG5JRJf9lbVzr4h7k3BPS+kKg
	PqZWZ+OmTDkEvAk9L9HcLUPQfb7u6hBDYkdfnv3qzlRltHtuuMTtnHWRPhjC5v4bFaiO
	DAPPfe/oBL3LIyy1CZgqKmgSfK/7bNIg7yXNS0yj85UxqYeU0NuVYVPuo55DyJAE9UVw
	cpnTJIXNWGLnYFXGP/gLmWMXCNvCtxJApXq8dVvO/GeOzmwcQS9TPDZND9t1zScPkMlT
	nYSM6BxKKLTLtL6rKYsVcg44lGbLDOToD0WnBf00rX+d/9ysJ2iQdQfEYdahaVyRZf+/
	fX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=CmnZfumF9iiGQAirSQFGi3SQU9LgHj3goRRvWShE7o4=;
	b=KLBE1E+tQ76/VKCBmgMIEWORaDMLSKGFOgrwFtzHml1Pljx0Ugt8qe5zdzuA8XHe89
	8hCwuzrP+BwUr02ggG8lsSfhDIDjwYh36xfgexKEasaT9uRqyR4sJ4RwvW9n2tWhITKI
	KRg2/Mm3bYm+TWSf0Zqh2p2WW/I8nagWM1hOsTugveK4yGQbGxDYgWhf6V9ZMFuIwRBn
	2F2K2t8zO7NHfzkWSJghOd/WYs5FTMRsdgH+h/G6/Fm56+xpOk170MsBrbJFhKypNR3X
	gVM6c/cvt1g3V9UYkwkfQELOzYKoDqcfZC9PeRg6bPrjSK6BbscYI9aS2NBxazXXa93W
	AaUQ==
X-Gm-Message-State: APjAAAXBBDUzUv3cYK0RodZrqs0/cicEWtGBBY2MbWi8WFkki20EmwL+
	1MP0qW6UtOl9zl41jqMYNnj0+0MXNjZQeTrdW91PzMUD
X-Google-Smtp-Source: APXvYqzLO6P4S8vKH8DFbY1zHV0m/K79w/hWvzKsLz1k9crs3GjF+GqDw2bVXyDktCHo8PO3XmGByMrE9P+c1/3iuEo=
X-Received: by 2002:a2e:94c7:: with SMTP id r7mr24394571ljh.91.1558007688734; 
	Thu, 16 May 2019 04:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190510174838.1968-1-2396sheetal@gmail.com>
In-Reply-To: <20190510174838.1968-1-2396sheetal@gmail.com>
From: Sheetal Singala <2396sheetal@gmail.com>
Date: Thu, 16 May 2019 17:24:37 +0530
Message-ID: <CAGzrpOypt7xqgRr7tCUKA=sc1YqefARSM25Rw_-F6G9T3qZVig@mail.gmail.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 16 May 2019 11:54:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Thu, 16 May 2019 11:54:51 +0000 (UTC) for IP:'209.85.208.169'
	DOMAIN:'mail-lj1-f169.google.com'
	HELO:'mail-lj1-f169.google.com' FROM:'2396sheetal@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.444  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, FROM_STARTS_WITH_NUMS, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.208.169 mail-lj1-f169.google.com 209.85.208.169
	mail-lj1-f169.google.com <2396sheetal@gmail.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 16 May 2019 08:22:43 -0400
Subject: [dm-devel] Fwd: [PATCH] md : dm: Fixed a brace coding style issue
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
Content-Type: multipart/mixed; boundary="===============7553541089540138098=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 16 May 2019 12:23:13 +0000 (UTC)

--===============7553541089540138098==
Content-Type: multipart/alternative; boundary="000000000000d82e170588ffee57"

--000000000000d82e170588ffee57
Content-Type: text/plain; charset="UTF-8"

Fixed a coding style issue.
---
 drivers/md/dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 043f0761e4a0..2a8820bd581d 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -781,7 +781,8 @@ static void close_table_device(struct table_device *td,
struct mapped_device *md
 }

 static struct table_device *find_table_device(struct list_head *l, dev_t
dev,
-                                             fmode_t mode) {
+                                             fmode_t mode)
+{
        struct table_device *td;

        list_for_each_entry(td, l, list)
-- 
2.17.1



-- 
Regards,
Sheetal Singala

--000000000000d82e170588ffee57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote">Fixed a coding style issue.=
<br>
---<br>
=C2=A0drivers/md/dm.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/md/dm.c b/drivers/md/dm.c<br>
index 043f0761e4a0..2a8820bd581d 100644<br>
--- a/drivers/md/dm.c<br>
+++ b/drivers/md/dm.c<br>
@@ -781,7 +781,8 @@ static void close_table_device(struct table_device *td,=
 struct mapped_device *md<br>
=C2=A0}<br>
<br>
=C2=A0static struct table_device *find_table_device(struct list_head *l, de=
v_t dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fmode_t mode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fmode_t mode)<br>
+{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct table_device *td;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 list_for_each_entry(td, l, list)<br>
-- <br>
2.17.1<br>
<br>
</div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Sheetal=
 Singala</div></div></div></div>

--000000000000d82e170588ffee57--


--===============7553541089540138098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============7553541089540138098==--

