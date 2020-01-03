Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8320412FB71
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jan 2020 18:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578071685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YjniyL4FYu7OhKuPfH8TTQJ76ePtww1fW+vCm++KxQg=;
	b=LZkoMTOj0BYAvOnPvmrCxP5M14CkoUYN91veyEDI2+Nffdp3Wu3a98s32YAQqwy19RwDVx
	OLvOAfPOlNFVRi8Kt5YgO3/9CYofAgJzJusuId6K9PAZYCtmJ2RgfM9WSmGiUwvGNddrKR
	N6eQtxgs8OU63tzuzgn4FiEDto/EOHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-J2NN-SSmNf-Vrqf35UuhqA-1; Fri, 03 Jan 2020 12:14:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A010E1005510;
	Fri,  3 Jan 2020 17:14:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A2715D9D6;
	Fri,  3 Jan 2020 17:14:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A39F7820EB;
	Fri,  3 Jan 2020 17:14:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 003HEBSU018677 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jan 2020 12:14:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 20312386; Fri,  3 Jan 2020 17:14:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F291387;
	Fri,  3 Jan 2020 17:14:08 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 003HE7j1012071; Fri, 3 Jan 2020 12:14:07 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 003HE7jP012067; Fri, 3 Jan 2020 12:14:07 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 3 Jan 2020 12:14:07 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Patrick Dung <patdung100@gmail.com>
In-Reply-To: <CAJTWkdu1-k5m0F-uzp-EMrncL1w4wLqEi8LgF0U1Js_Nf-YphQ@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2001031206190.11685@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAJTWkdu1-k5m0F-uzp-EMrncL1w4wLqEi8LgF0U1Js_Nf-YphQ@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] About dm-integrity layer and fsync
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: J2NN-SSmNf-Vrqf35UuhqA-1
X-Mimecast-Spam-Score: 0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="185206533-1783000016-1578071647=:11685"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
--185206533-1783000016-1578071647=:11685
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On Fri, 3 Jan 2020, Patrick Dung wrote:

> Hello,
>=20
> A quick question on dm-integrity. Does dm-integrity layer honors fsync?

Yes it does.

However, it writes data into the journal and when the journal is flushed,=
=20
it reports the fsync function as finished.

On a mechanical disk, writes to contiguous space (i.e. the journal) are=20
faster than random writes all over the disk, that's why you see better=20
performance with dm-integrity than without it.

Mikulas

> I was testing dm-integrity and performance. It had a strange result that =
using dm-integrity with journal is faster than a normal file system or dm-i=
ntegrity with
> bitmap (no journal). fio is used for testing the storage performance. The=
 device is a SATA hard disk drive. Then I created a 100GB partition for tes=
ting.
>=20
> Below is the test cases:
>=20
> 1) XFS on a partition directly test case
>=20
> 2) dm-integrity: crc32c on a partition with default setting journal commi=
t interval is 10 seconds. Then create XFS on it. test case
>=20
> 3) dm-integrity: crc32c on a partition default setting journal commit int=
erval set to 5 seconds. Then create XFS on it.
>=20
> 4) dm-integrity:=C2=A0 crc32c on a partition default setting but using bi=
tmap instead of journal. Then create XFS on it.
>=20
> FIO command:
>=20
> fio --filename=3D./t1 --direct=3D1 --rw=3Drandrw --refill_buffers --noran=
dommap --randrepeat=3D0 --ioengine=3Dsync --bs=3D4k --rwmixread=3D75 --iode=
pth=3D16 --numjobs=3D8 --runtime=3D60
> --group_reporting --fsync=3D1 --name=3D4ktest --size=3D4G
>=20
> Result:
>=20
>  1. Read/Write IOPS: 117/41. Read/Write Speed 481KB/s 168KB/s
>  2. Read/Write IOPS: 178/59. Read/Write Speed 732KB/s 244KB/s
>  3. Read/Write IOPS: 169/57. Read/Write Speed 695KB/s 236KB/s
>  4. Read/Write IOPS: 97/32. Read/Write Speed 400K/s 131KB/s
> The original discussion in: https://gitlab.com/cryptsetup/cryptsetup/issu=
es/513 . Milan Broz said the dm-devel mailing list is a suitable place to d=
iscuss the probem.
>=20
> Thanks in advance.
>=20
> Patrick
>=20
> 
--185206533-1783000016-1578071647=:11685
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--185206533-1783000016-1578071647=:11685--

