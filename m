Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EFC6D12FA03
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jan 2020 16:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578066760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6/4ZNLChalNLeINGM1IkdgsmCGNz64/osGU3NH3DZ9Y=;
	b=LMEKv42FOrjJHWIrMxcDKQbZ2jKynkq2xSABQ6m458W0YpaJ2GdVCwuj/T8W1p2vEIgvZ9
	MUmI6M3wsBTQ1cl413UJfu6TMSGAMo3awIo+xYwkuaNNAEUMMLoqyNkDSWnyRR043W82mO
	aoc1D1iJ3XhhnUavYA1VJO8A6jH74eA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-H1dsj-S-POW5Cm61Q-w2jA-1; Fri, 03 Jan 2020 10:52:38 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13FB210054E3;
	Fri,  3 Jan 2020 15:52:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73F7960C81;
	Fri,  3 Jan 2020 15:52:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D39B418095FF;
	Fri,  3 Jan 2020 15:52:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 003Fq0fM016766 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jan 2020 10:52:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2E5FB2166B29; Fri,  3 Jan 2020 15:52:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 298452166B2B
	for <dm-devel@redhat.com>; Fri,  3 Jan 2020 15:51:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D33D780157B
	for <dm-devel@redhat.com>; Fri,  3 Jan 2020 15:51:52 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-49-tVM59_eKNfy8VfTDH6lKCA-1; Fri, 03 Jan 2020 10:51:50 -0500
Received: by mail-ed1-f49.google.com with SMTP id bx28so41900417edb.11
	for <dm-devel@redhat.com>; Fri, 03 Jan 2020 07:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=H0vwuL+Fr4bFzG1GGCgRYikueiYqf4I6EaaeIjddmxA=;
	b=m2bOKSuPpriwqUARkik0HVvfaJLaZnd4jrQBGMzLaODcBj+4WRWGeODxiIR0snjMty
	TyKd7n7hwxxhuxdsvubsipCbHiW6GjkRg0ZiH3n1//oPsFbgcpsCzRPx/HsEx6+feuOo
	v6G0CGTK6//pRyikRjtxWKNqE2OA+uaqmj1H3TIOllXVCSrLgZyZB5dOCABNDPRL3yTz
	6PbRTGVU8cXOmYdJ89cSXpgoG6LTD9tCCTEYJ5q4zP3SKYx53KrHDx9B3mgeyTajkuoV
	WzpLX73e/NFmN+l04Bs12r02wGcVbdsHHgMw8pQq4DW5+gMsNhj/gM247ncWFXpnBbWV
	L8nA==
X-Gm-Message-State: APjAAAV3IQP092zjIQIOI0L8zzL0lReWhpGF6443W0F/bwpmhaYOiJ1e
	icmkv8srRWbxq3c4YoISk6/PYZbKe5+pKL9iO3kkj2q9
X-Google-Smtp-Source: APXvYqyo0fGRekBI4gf1K3qwPgK7/yddQMsaKb41POLPhsuBlIAVePOHIsrsNO8W1TRS6N23nX/nQkLYCBVEdg7vNaA=
X-Received: by 2002:a05:6402:697:: with SMTP id
	f23mr96684911edy.0.1578066708547; 
	Fri, 03 Jan 2020 07:51:48 -0800 (PST)
MIME-Version: 1.0
From: Patrick Dung <patdung100@gmail.com>
Date: Fri, 3 Jan 2020 23:51:24 +0800
Message-ID: <CAJTWkdu1-k5m0F-uzp-EMrncL1w4wLqEi8LgF0U1Js_Nf-YphQ@mail.gmail.com>
To: dm-devel@redhat.com
X-MC-Unique: tVM59_eKNfy8VfTDH6lKCA-1
X-MC-Unique: H1dsj-S-POW5Cm61Q-w2jA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Subject: [dm-devel] About dm-integrity layer and fsync
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============1583472463075559882=="

--===============1583472463075559882==
Content-Type: multipart/alternative; boundary="0000000000009853c9059b3e4986"

--0000000000009853c9059b3e4986
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

A quick question on dm-integrity. Does dm-integrity layer honors fsync?

I was testing dm-integrity and performance. It had a strange result that
using dm-integrity with journal is faster than a normal file system or
dm-integrity with bitmap (no journal). fio is used for testing the storage
performance. The device is a SATA hard disk drive. Then I created a 100GB
partition for testing.

Below is the test cases:

1) XFS on a partition directly test case

2) dm-integrity: crc32c on a partition with default setting journal commit
interval is 10 seconds. Then create XFS on it. test case

3) dm-integrity: crc32c on a partition default setting journal commit
interval set to 5 seconds. Then create XFS on it.

4) dm-integrity:  crc32c on a partition default setting but using bitmap
instead of journal. Then create XFS on it.

FIO command:

fio --filename=3D./t1 --direct=3D1 --rw=3Drandrw --refill_buffers --norando=
mmap
--randrepeat=3D0 --ioengine=3Dsync --bs=3D4k --rwmixread=3D75 --iodepth=3D1=
6
--numjobs=3D8 --runtime=3D60 --group_reporting --fsync=3D1 --name=3D4ktest
--size=3D4G

Result:

   1. Read/Write IOPS: 117/41. Read/Write Speed 481KB/s 168KB/s
   2. Read/Write IOPS: 178/59. Read/Write Speed 732KB/s 244KB/s
   3. Read/Write IOPS: 169/57. Read/Write Speed 695KB/s 236KB/s
   4. Read/Write IOPS: 97/32. Read/Write Speed 400K/s 131KB/s

The original discussion in:
https://gitlab.com/cryptsetup/cryptsetup/issues/513 . Milan Broz said the
dm-devel mailing list is a suitable place to discuss the probem.

Thanks in advance.

Patrick

--0000000000009853c9059b3e4986
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>A qu=
ick question on dm-integrity. Does dm-integrity layer honors fsync?

</div><div><br></div><div>I was testing dm-integrity and performance. It ha=
d a strange result that using dm-integrity with journal is faster than a no=
rmal file system or dm-integrity with bitmap (no journal). fio is used for =
testing the storage performance. The device is a SATA hard disk drive. Then=
 I created a 100GB partition for testing.
<p dir=3D"auto">Below is the test cases:</p><p dir=3D"auto"> 1) XFS on a pa=
rtition directly
test case</p><p dir=3D"auto">2) dm-integrity: crc32c on a partition with de=
fault setting
journal commit interval is 10 seconds. Then create XFS on it.
test case</p><p dir=3D"auto">3) dm-integrity: crc32c on a partition default=
 setting
journal commit interval set to 5 seconds. Then create XFS on it.</p><p>4) d=
m-integrity:=C2=A0
crc32c on a partition default setting but using bitmap instead of journal. =
Then create XFS on it.</p><p>FIO command:</p><p>
fio --filename=3D./t1 --direct=3D1 --rw=3Drandrw --refill_buffers --norando=
mmap --randrepeat=3D0 --ioengine=3Dsync --bs=3D4k --rwmixread=3D75 --iodept=
h=3D16 --numjobs=3D8 --runtime=3D60 --group_reporting --fsync=3D1 --name=3D=
4ktest --size=3D4G

</p><p dir=3D"auto">Result:</p>
<ol dir=3D"auto"><li>Read/Write IOPS: 117/41. Read/Write Speed 481KB/s 168K=
B/s</li><li>Read/Write IOPS: 178/59. Read/Write Speed 732KB/s 244KB/s</li><=
li>Read/Write IOPS: 169/57. Read/Write Speed 695KB/s 236KB/s</li><li>
Read/Write IOPS: 97/32. Read/Write Speed 400K/s 131KB/s</li></ol></div><div=
>The original discussion in: <a href=3D"https://gitlab.com/cryptsetup/crypt=
setup/issues/513" target=3D"_blank">https://gitlab.com/cryptsetup/cryptsetu=
p/issues/513</a> . Milan Broz said the dm-devel mailing list is a suitable =
place to discuss the probem.</div><div><br></div><div>Thanks in advance.</d=
iv><div><br></div><div>Patrick<br></div></div></div>

--0000000000009853c9059b3e4986--

--===============1583472463075559882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============1583472463075559882==--

