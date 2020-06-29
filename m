Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C355620D0F3
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-TRWqhH2ZPSO4XjaorfTdLA-1; Mon, 29 Jun 2020 14:39:50 -0400
X-MC-Unique: TRWqhH2ZPSO4XjaorfTdLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 407CE804003;
	Mon, 29 Jun 2020 18:39:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E4161001268;
	Mon, 29 Jun 2020 18:39:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC5241806B0B;
	Mon, 29 Jun 2020 18:39:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TDABnk007648 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 09:10:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE9D22026E1C; Mon, 29 Jun 2020 13:10:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA4ED2026D5D
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 13:10:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DC68821BAF
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 13:10:04 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-290-nwiFf1P3PryvDWuKMaW7UA-1; Mon, 29 Jun 2020 09:10:00 -0400
X-MC-Unique: nwiFf1P3PryvDWuKMaW7UA-1
Received: by mail-ej1-f44.google.com with SMTP id ga4so16464905ejb.11
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 06:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=TPMy5xAksoti/74t5UefK5eDoOvx9lm/loBAX+gYRGM=;
	b=gcqhhKrTpHgMcn0L1xw5/htyslT67vQd5PNbzUNkD2JAlQRYXS9BGURqLg08fyoPZy
	3NT1WBJJKlTph/i3EAlz/rt38DMzWDNCthwinCVRKQisH4bddj2FRll7gGmkIYEwmUTc
	Rd6OFlSa9N5kJiILyq8pR3NZkrGj3U6MXMS2qqDkX4F63aNOES82OQGOOJqgzLWgv3FL
	k9Z9XxStTF+BsxgYDcA0b1XOyfo0U9905EsZGI6boRXwrniJ4JaOvHoSe5XVSYX4r6sL
	4vVJ5XqoTqnKAedBlBJ4x5aHra66iEMjoZxdULzNp9J6g6Znk+3e9QFpQGoS9Ywc3MDw
	yC/w==
X-Gm-Message-State: AOAM531fhqlhkJnxCqZE5Rq1na8EO2naFQuiNYxoXvLu46alA32pK5p1
	Z2GZBmfeFTk5JtvsG9l2lbOQPvu/oLkvxB0PoKJ1zqpA
X-Google-Smtp-Source: ABdhPJwrAzF6SBh1CYTzXY2ObIVUFOPEM394R5AEDdB1/+awVmmuH3rgUUQpQsITsEWXxdc+zJk9NHiERv3IBQQa+vI=
X-Received: by 2002:a17:906:1044:: with SMTP id
	j4mr13602391ejj.187.1593436199108; 
	Mon, 29 Jun 2020 06:09:59 -0700 (PDT)
MIME-Version: 1.0
From: laurent cop <laurent.cop@gmail.com>
Date: Mon, 29 Jun 2020 15:09:23 +0200
Message-ID: <CAHzw6onkk9TcHE6m_MwO7WRTSE5ehh1bg3YG9HeT_7p6oOZM8g@mail.gmail.com>
To: dm-crypt@saout.de, dm-devel@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Subject: [dm-devel] Need some advices on LUKS2 cryptsetup (performance issue
	with integrity)
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8834142851829430321=="

--===============8834142851829430321==
Content-Type: multipart/alternative; boundary="0000000000009ec80705a938c677"

--0000000000009ec80705a938c677
Content-Type: text/plain; charset="UTF-8"

 Hello,

I would need some advice on LUKS2 cryptsetup (confidentiality + integrity).

My context was :
*encryption (cryptsetu*p aes_xts_plain64) on xfs formatted Raid5 (4+1 for
parity) soft raid (mdadm) on SSD nvme disks

I would like to include crypsetup integrity feature with
--cipher aes-gcm-random --integrity aead
on the same stack ( on xfs formatted Raid5 (4+1 for parity) soft raid
(mdadm) on SSD nvme disks)

Few tests with fio (I am testing *sequential write performances*)
--ioengine=libaio --bs=4K --size=30G --end_fsync=1 --numjobs=4

Provide me* a ratio of 3 between the two use cases.*

A study *"Practical Cryptographic Data Integrity Protection with Full Disk
Encryption Extended Version" from 1 Jul 2018*
seems to show this kind of ratio and illustrates the difference between
(JOURNAL and NO JOURNAL). In the case of NO JOURNAL, integrity seems to
have very low effects on performances.

1)How can I improve my performances with --cipher aes-gcm-random
--integrity aead ?  (this ratio of 3 with aes_xts_plain64 is huge)
2) What are the impacts of NO JOURNAL, I understand the goal of
journalisation in fs in case of a crash. Is it the same goal?

Thank you.

--0000000000009ec80705a938c677
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>
Hello,</div><div><br></div><div>I would need some advice on LUKS2 cryptsetu=
p (confidentiality + integrity). <br></div><div><br></div><div>My context w=
as :</div><div><b>encryption (cryptsetu</b>p aes_xts_plain64) on xfs format=
ted Raid5 (4+1 for parity) soft raid (mdadm) on SSD nvme disks<br></div><br=
></div><div>I would like to include crypsetup integrity feature with</div><=
div>--cipher aes-gcm-random --integrity aead</div><div>on the same stack (
on xfs formatted Raid5 (4+1 for parity) soft raid (mdadm) on SSD nvme disks=
)</div><div><br></div><div>Few tests with fio (I am testing <b>sequential w=
rite performances</b>)<br></div><div>--ioengine=3Dlibaio --bs=3D4K --size=
=3D30G --end_fsync=3D1 --numjobs=3D4</div><div><br></div><div>Provide me<b>=
 a ratio of 3 between the two use cases.</b></div><div><br></div><div>A stu=
dy <b>&quot;Practical Cryptographic Data Integrity Protection with Full Dis=
k Encryption Extended Version&quot; from 1 Jul 2018</b> <br></div><div>seem=
s to show this kind of ratio and illustrates the difference between=C2=A0 (=
JOURNAL and NO JOURNAL). In the case of NO JOURNAL, integrity=C2=A0seems to=
 have very low effects on performances.</div><div><br></div><div>1)How can =
I improve my performances with=20
--cipher aes-gcm-random --integrity aead ?=C2=A0 (this ratio of 3 with aes_=
xts_plain64 is huge)</div><div>2) What are the impacts of NO JOURNAL, I und=
erstand the goal of journalisation in fs in case of a crash. Is it the same=
 goal?</div><div><br></div><div>Thank you.<br></div><div><br></div><div><di=
v><br>
<br></div></div></div>

--0000000000009ec80705a938c677--

--===============8834142851829430321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============8834142851829430321==--

