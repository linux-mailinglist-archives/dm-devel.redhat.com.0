Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 11B87196F78
	for <lists+dm-devel@lfdr.de>; Sun, 29 Mar 2020 20:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585507963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YcgwZbo/5JQ+9QDPAk4D3UnNH1BOC1yUE26n/UnHlsw=;
	b=K7QRUxexmGIPw7ilE09mpGc3Ysz8qwwTAzU1tzPL4AgPSGzKHac0LvpsL2XcAcTaZjYZXB
	RvtBAS4mp1jF5AWJcLSuWgFINLQgQi0sEjoAKfgLy0EmpfSYrES2MgZU81kPwV3jQu7uhF
	LfZf3TvNgwLwKv6K8/zyoVA18kJtEU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-dvW9iU25Mr-D_8hGNl7gPg-1; Sun, 29 Mar 2020 14:52:41 -0400
X-MC-Unique: dvW9iU25Mr-D_8hGNl7gPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 260188017DF;
	Sun, 29 Mar 2020 18:52:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8FBC1000325;
	Sun, 29 Mar 2020 18:52:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BD92944CA;
	Sun, 29 Mar 2020 18:52:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QBObdb018643 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 07:24:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37F88107CD07; Thu, 26 Mar 2020 11:24:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32DD8107CD08
	for <dm-devel@redhat.com>; Thu, 26 Mar 2020 11:24:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE7B680029A
	for <dm-devel@redhat.com>; Thu, 26 Mar 2020 11:24:31 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1585221871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=cljuU7tfGo7osPGX/tvejH6dxI/CXHOL0QH/Vs+aSNk=;
	b=NYIO7GJggnsUk3eGBgGGXDpoZfX6QwSX8DLd3VRrgB02005ZXdMELW1x8Qsn7hjw7QdjSR
	e5XKVXL6YVCVfsoG39IJ0tvAJfnHLl/wqTiQNhLEeN6fBE4shqtapKSGCBZeINsIfVvfrN
	m9C5DGKu2DCwsHAsNBtQrbhk6Q/PYepffBeznBB4Y7fgFtiZvC0enam7Zlwp+CjTdTSR1u
	u0qq6CRiY2zd/05tIaImgWn8OWg3KVMbaIbIrIBEm21hTyPUgsFSHYImVVE55KtkD/Cb7G
	UHlDT5N0+4of4KJCnjLAiEIypcqDg8vh3hreq3K1CfwznlZVmUdQOnj1cQisqg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1585221871; a=rsa-sha256;
	cv=none;
	b=aHzn2vt/7ctHsnbQmi9YpbumPxYfeT6Q7ahGk6Bcm7owSNqMlPG6zX0C6JxscWo0kOCiT9
	4Y/evBHqHJ//smZ/XlqGHId4Zr94GsuH4BNVVo98ZnDBwmq/VyKBwso7tbT5mX9Z/ja2gu
	UNjFEiPw4suJ5g09P3eIBPChfn8iwWlulInFi9y6uGC74dMAyO2WGPN+SM0gWEhsdKxG0Q
	a+1I0ZBV+CCaSQBhWK28IJcJEzuXWT7v+8A3bFT4zH8KR6qtoN9YpZR2vX4YtONlYxsQCe
	Djh0nCu7XByJ0sHbQ9XF8eHmJtWB8VxKVgRis2FBoy3GZg6AymzvpaeLqFVtNA==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=web.de header.s=dbaedf251592 header.b=JwpeMjK3;
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of lukasstraub2@web.de designates
	212.227.15.4 as permitted sender)
	smtp.mailfrom=lukasstraub2@web.de
Received: from mout.web.de (mout.web.de [212.227.15.4]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-25-askaShdOPemEsT92ZHSXGA-1;
	Thu, 26 Mar 2020 07:24:29 -0400
X-MC-Unique: askaShdOPemEsT92ZHSXGA-1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1585221867;
	bh=Z+9sFC4cAbNzJXxzzeYsDQUq/tv/qxB79OliLkrBa9o=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JwpeMjK3BwdSorLFcodZFXBwYqIAnmnFhZP0IZa7lHJfNkUCaQ3qF/5xX7PTP/yJI
	xOO7qmbMZoZYTxDLayLkhwu97JSyGkwN47Rr1PgFg8nMNHIiE3vwUg9Hpcd6JceIK6
	fRgT7nNxqusE1G9SbFJnZGINJm0gqaNdQHlxiop0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([89.247.255.128]) by smtp.web.de (mrweb004
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0LocJe-1jkQqn2eni-00gUKp;
	Thu, 26 Mar 2020 12:24:27 +0100
Date: Thu, 26 Mar 2020 12:24:18 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200326122418.741b2ffc@luklap>
In-Reply-To: <20200324191148.GA2921@redhat.com>
References: <20200227142601.61f3cd54@luklap> <20200324171821.GA2444@redhat.com>
	<20200324195912.518dc87c@luklap> <20200324191148.GA2921@redhat.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:J8uqv5axDQNEgR1Ps1F6+B1T/JmFHn6v3TJPKAlwsFpaMMEPObT
	miKPZ8At4CC1USmSi3VAJ+JLu7IeWkpK2qMlK6uS4etjv9r196nm80/FgKFObaYXfAsb38I
	4NHu1Gcach/eU6V+sZcHULbP4JK3arVSXSlYylOxXacS2wSbedTeQZl6B+4uBLTkoSPDT5f
	GrA9USOkqiRRN3u6sOMgw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xh8/46vE/oY=:An3NeBCTkbRM8qGlraf1jI
	1RN4xPZWvakgwcM6ytlYnWIyHYNK7RUAcSmsGJMhZZavL0uXyImR+0hQRoMDK6ryhSfw4tHhl
	7ecHn00HAMH4MXDpVWahmI8oVEtC6KNLhhiUoZHpffV3nq9UgF6Ya+jYWQc7Nee4a5KKnqqFS
	0diCnrNyppfCco5hL1ACTxyAclBZ1k1e7BJj6clYBZUBihfBVTk51nvVHsrgYpLlChB0mh/2R
	AGdoKhVDqSuDmemDBtARyXhxRiNbe2Zx7onsymx2vUkUmM+gaKNkUPi+qgythgDYraVm9TTN4
	ifycDDqaroax7Al709S5RZv/rj9etDPo70VDEGEZaWOIoyGrXE5Erxc2Z2Ws8/RREYLrxPcDD
	id8jnxa/eEYR2jz6310iTkR5rmWV6jmDGZxOgL7FwdmVFG2LWsbAtwn+ZEsecufyyLB0/fde1
	MRNAm3I3f4MHu6G3Ry6NqaUNtZoaJLpiTNFoRV9DdmQ2oBS1h8Hsjhd5WQKyvzuemNd5UpLMB
	KGrog/1vgjS9ekGGaeX+bVr6cz1uGyEj0cWp3TOR3notix/iHKLRa8tUxuInjieb1NbiNP3Ux
	ybtc1x+vF65XR3zxXBR6c1Hz0dqcJpgl2o3nIagAD42hx9qDwrMpAZu/EHD56KRGzkg6Z92aW
	bTv6M9ZebPWYCLQAduRacixxP1OWoTZgUXJYJvbRW4xRV/44nR82OmI2Ht3JsHrg8KaH/E0ba
	rIpUqWLjVveVo6EeigvkhyTOGxXgtcGaewOPJv900qgEjuEfvvaYRBcGa7tBwHD4RsFbLQ6xu
	oiCI+hX5qIGFN4q8IugmyHjXJCqIQXtE5+uYZOQYoyRHS1RM6/XWxXow/zf6LJVefhjRazfot
	8qOEdLRTaYtKcx5jxMaGTKBc+Erd1qXeXBNOtO74S3ZpvKtsiE0mHQYEmGVX1+zAdw0+Px8/9
	N2Ybe/8zAixtzGwHMMcMRtHVcz05A20Z4NnYgD1hYMXV01ug7VvZ1RPR+IuKLppeuHt7WqlC0
	2dYuZRCxubmOOSZb2MjjwQcnnJn/pFHGzIzC7D84o1giLj8xwWUomiV60OxiJEsUANXCzHXb0
	Emwdyf6cDBJKw0wEIqPLEeSejOv2q9GdlpsLQgrZnzDWMEwRhSzcFL8+eHUYOtbJ4QETjk5tz
	XQDHeUmG+kPO+iftP9OM2gBMaOtrQmuKJ+vaT2EcyZiRxjpn9dvuqk92h7RQbiDkVF0P93XgT
	WCFxcsGiVlh8G8DmZ
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=web.de header.s=dbaedf251592
	header.b=JwpeMjK3; dmarc=none;
	spf=pass (relay.mimecast.com: domain of lukasstraub2@web.de designates
	212.227.15.4 as permitted sender)
	smtp.mailfrom=lukasstraub2@web.de
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 29 Mar 2020 14:51:25 -0400
Cc: dm-devel <dm-devel@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm-integrity: Prevent RMW for full
 metadata buffer writes
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
Content-Type: multipart/mixed; boundary="===============2527788858527776397=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

--===============2527788858527776397==
Content-Type: multipart/signed; boundary="Sig_/rBuFSl4aDuDI2ufSEpF2qcj";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/rBuFSl4aDuDI2ufSEpF2qcj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Mar 2020 15:11:49 -0400
Mike Snitzer <snitzer@redhat.com> wrote:

> On Tue, Mar 24 2020 at  2:59pm -0400,
> Lukas Straub <lukasstraub2@web.de> wrote:
>=20
> > On Tue, 24 Mar 2020 13:18:22 -0400
> > Mike Snitzer <snitzer@redhat.com> wrote:
> >  =20
> > > On Thu, Feb 27 2020 at  8:26am -0500,
> > > Lukas Straub <lukasstraub2@web.de> wrote:
> > >  =20
> > > > If a full metadata buffer is being written, don't read it first. Th=
is
> > > > prevents a read-modify-write cycle and increases performance on HDD=
s
> > > > considerably.
> > > >=20
> > > > To do this we now calculate the checksums for all sectors in the bi=
o in one
> > > > go in integrity_metadata and then pass the result to dm_integrity_r=
w_tag,
> > > > which now checks if we overwrite the whole buffer.
> > > >=20
> > > > Benchmarking with a 5400RPM HDD with bitmap mode:
> > > > integritysetup format --no-wipe --batch-mode --interleave-sectors $=
((64*1024)) -t 4 -s 512 -I crc32c -B /dev/sdc
> > > > integritysetup open --buffer-sectors=3D1 -I crc32c -B /dev/sdc hdda=
_integ
> > > > dd if=3D/dev/zero of=3D/dev/mapper/hdda_integ bs=3D64K count=3D$((1=
6*1024*4)) conv=3Dfsync oflag=3Ddirect status=3Dprogress
> > > >=20
> > > > Without patch:
> > > > 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 400.326 s, 10.7 MB/s
> > > >=20
> > > > With patch:
> > > > 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 41.2057 s, 104 MB/s
> > > >=20
> > > > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > > > ---
> > > > Hello Everyone,
> > > > So here is v2, now checking if we overwrite a whole metadata buffer=
 instead
> > > > of the (buggy) check if we overwrite a whole tag area before.
> > > > Performance stayed the same (with --buffer-sectors=3D1).
> > > >=20
> > > > The only quirk now is that it advertises a very big optimal io size=
 in the
> > > > standard configuration (where buffer_sectors=3D128). Is this a Prob=
lem?
> > > >=20
> > > > v2:
> > > >  -fix dm_integrity_rw_tag to check if we overwrite a whole metadat =
buffer
> > > >  -fix optimal io size to check if we overwrite a whole metadata buf=
fer
> > > >=20
> > > > Regards,
> > > > Lukas Straub   =20
> > >=20
> > >=20
> > > Not sure why you didn't cc Mikulas but I just checked with him and he
> > > thinks:
> > >=20
> > > You're only seeing a boost because you're using 512-byte sector and
> > > 512-byte buffer. Patch helps that case but hurts in most other cases
> > > (due to small buffers). =20
> >=20
> > Hmm, buffer-sectors is still user configurable. If the user wants fast
> > write performance on slow HDDs he can set a small buffer-sector and
> > benefit from this patch. With the default buffer-sectors=3D128 it
> > shouldn't have any impact. =20
>=20
> OK, if you'd be willing to conduct tests to prove there is no impact
> with larger buffers that'd certainly help reinforce your position and
> make it easier for me to take your patch.
>=20
> But if you're just testing against slow HDD testbeds then the test
> coverage isn't wide enough.
>=20
> Thanks,
> Mike
>=20

Sure,
This time testing with an Samsung 850 EVO SSD:

without patch:

root@teststore:/home/lukas# integritysetup format --no-wipe --batch-mode -I=
 crc32c -B /dev/sdc1
root@teststore:/home/lukas# integritysetup open -I crc32c -B /dev/sdc1 ssda=
_integ
root@teststore:/home/lukas# dd if=3D/dev/zero of=3D/dev/mapper/ssda_integ b=
s=3D64K count=3D$((16*1024*4)) conv=3Dfsync oflag=3Ddirect status=3Dprogres=
s
4177264640 bytes (4.2 GB, 3.9 GiB) copied, 28 s, 149 MB/s
65536+0 records in
65536+0 records out
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 28.8946 s, 149 MB/s
root@teststore:/home/lukas# dd if=3D/dev/zero of=3D/dev/mapper/ssda_integ b=
s=3D4M count=3D$((256*4)) conv=3Dfsync oflag=3Ddirect status=3Dprogress
4211081216 bytes (4.2 GB, 3.9 GiB) copied, 22 s, 191 MB/s
1024+0 records in
1024+0 records out
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 22.6355 s, 190 MB/s
root@teststore:/home/lukas# time mkfs.ext4 /dev/mapper/ssda_integ 4g
mke2fs 1.45.5 (07-Jan-2020)
Creating filesystem with 1048576 4k blocks and 262144 inodes
Filesystem UUID: 679c4808-d549-4576-a8ef-4c46c78c6070
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done


real    0m0.318s
user    0m0.016s
sys     0m0.001s
root@teststore:/home/lukas# mount /dev/mapper/ssda_integ /mnt/
root@teststore:/home/lukas# cd /mnt/
root@teststore:/mnt# time tar -xJf /home/lukas/linux-5.5.4.tar.xz

real    0m18.708s
user    0m14.351s
sys     0m8.585s
root@teststore:/mnt# time rm -rf linux-5.5.4/

real    0m3.226s
user    0m0.117s
sys     0m2.958s


with patch:

root@teststore:/home/lukas# integritysetup format --no-wipe --batch-mode -I=
 crc32c -B /dev/sdc1
root@teststore:/home/lukas# integritysetup open -I crc32c -B /dev/sdc1 ssda=
_integ
root@teststore:/home/lukas# dd if=3D/dev/zero of=3D/dev/mapper/ssda_integ b=
s=3D64K count=3D$((16*1024*4)) conv=3Dfsync oflag=3Ddirect status=3Dprogres=
s
4169007104 bytes (4.2 GB, 3.9 GiB) copied, 27 s, 154 MB/s
65536+0 records in
65536+0 records out
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 27.9165 s, 154 MB/s
root@teststore:/home/lukas# dd if=3D/dev/zero of=3D/dev/mapper/ssda_integ b=
s=3D4M count=3D$((256*4)) conv=3Dfsync oflag=3Ddirect status=3Dprogress
4169138176 bytes (4.2 GB, 3.9 GiB) copied, 22 s, 189 MB/s
1024+0 records in
1024+0 records out
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 22.9181 s, 187 MB/s
root@teststore:/home/lukas# time mkfs.ext4 /dev/mapper/ssda_integ 4g
mke2fs 1.45.5 (07-Jan-2020)
Creating filesystem with 1048576 4k blocks and 262144 inodes
Filesystem UUID: 9a9decad-19e2-46a4-8cc5-ce27238829f2
Superblock backups stored on blocks:=20
        32768, 98304, 163840, 229376, 294912, 819200, 884736

Allocating group tables: done                           =20
Writing inode tables: done                           =20
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done=20


real    0m0.341s
user    0m0.000s
sys     0m0.016s
root@teststore:/home/lukas# mount /dev/mapper/ssda_integ /mnt/
root@teststore:/home/lukas# cd /mnt/
root@teststore:/mnt# time tar -xJf /home/lukas/linux-5.5.4.tar.xz

real    0m18.409s
user    0m14.191s
sys     0m8.585s
root@teststore:/mnt# time rm -rf linux-5.5.4/

real    0m3.200s
user    0m0.133s
sys     0m2.979s


Regards,
Lukas Straub

--Sig_/rBuFSl4aDuDI2ufSEpF2qcj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl58kOIACgkQNasLKJxd
sljn2Q//fdRtqln3arcfUfX72NS0AlgI0CCCB7uwcn974EK4BeqEKJeu612dloWE
I9CXr6d47xbsJ0V3rsiPyLilbFWLc4898optf0PqEvI8rQ4ksbY9lEuS0vqkymSR
GeIMEQNbpn5uK+K+zVDGnR5Yg1+XYsfxTwGtwotHmFGMfYBYnCIClEc2gPykMW+Z
9hfaCdpLYAy51yHqawZsIjz7wdPfp5EQB2Mcs4nl4vV9rp24T+Vs8qOaA2E1c1OE
hGpSX9b+Gs0UW5pT6DJyScugqIdkSEvKwGyz1riisrLHnUP3M9akDlVcMUU/Q8o3
xV9N473P7ZYUP3dqcHPUQoeTP4xhzWXM6cQHPVWNHfaTQz7c+gJP6duRw5kT2PVD
1AEuciRZcSqvz6dXoYoY2pCQ/nh7Ry4T2yqi/rVQhity10ZJRKYXWYviwnRP+Kxg
wPfONRya5iMHBKHspO6eVpkS2B6jPd4UHhiDFnj1/Ls66ijo3G4VccdNl0OWpjv6
tSTP3Cl2BrC9NjwzerhFSmU+7K5WReOWeah0eOeiBRV5BDrZ4x8FZA6QqhHjBKlQ
7TXyhRf7KcK06rgB3tRUtG3/P7kQx3KY8H4sLOtlngYgqBYmAstXBa0BG7Md51v0
qI5Y2smMmHI/UBnaPw+xZZTxqHBF4A/jAJLAZZs5krKUuiSTdNQ=
=pSN3
-----END PGP SIGNATURE-----

--Sig_/rBuFSl4aDuDI2ufSEpF2qcj--


--===============2527788858527776397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2527788858527776397==--

