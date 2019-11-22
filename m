Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 421C61069AB
	for <lists+dm-devel@lfdr.de>; Fri, 22 Nov 2019 11:09:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574417395;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fDdtltqGy83AlJj5gUTcqpcujcqhRsoguxwHmsBrXQI=;
	b=GrEWeC2qU5y32ovLQzsShoDVIq38hIEQkGCVuiv9rW2uyD6lFFWviaHR6q08dRohT01tcH
	JC7WyG2M6+KkaeBF1II/KGdVBrqRyaigOS/E3O0DH0W5VTcoC0VweQE3BXegI+/LzXzusG
	kFQZ+Or+kclw2h5fIo74BCgtmHUogOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-rBaKQDM8Oiy08rswZN21sw-1; Fri, 22 Nov 2019 05:09:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FFBB18557C0;
	Fri, 22 Nov 2019 10:09:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7E5C60141;
	Fri, 22 Nov 2019 10:09:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B33118089C8;
	Fri, 22 Nov 2019 10:09:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMA9Oxl010359 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 05:09:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9E3DC2166B27; Fri, 22 Nov 2019 10:09:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 988902157F3E
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 10:09:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A9C8101A55F
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 10:09:22 +0000 (UTC)
Received: from szilassi.eckner.net (szilassi.eckner.net [193.30.121.109])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-264-WLtkZYPmM3-fAA_nVdKyIg-1; Fri, 22 Nov 2019 05:09:20 -0500
Received: from nlopc43.ioq.uni-jena.de (musketeer-15.fusion.uni-jena.de
	[::ffff:141.35.40.15]) (AUTH: PLAIN erich@eckner.net, )
	by szilassi.eckner.net with ESMTPSA
	id 0000000000760302.000000005DD7B3CE.00013011;
	Fri, 22 Nov 2019 11:09:17 +0100
Date: Fri, 22 Nov 2019 11:09:10 +0100 (CET)
From: Erich Eckner <device-mapper@eckner.net>
X-X-Sender: erich@nlopc43.ioq.uni-jena.de
To: dm-devel@redhat.com
In-Reply-To: <alpine.LNX.2.21.99999.375.1911221006490.1609868@nlopc43.ioq.uni-jena.de>
Message-ID: <alpine.LNX.2.21.99999.375.1911221102150.1609868@nlopc43.ioq.uni-jena.de>
References: <alpine.LNX.2.21.99999.375.1911221006490.1609868@nlopc43.ioq.uni-jena.de>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
Mime-Version: 1.0
X-MC-Unique: WLtkZYPmM3-fAA_nVdKyIg-1
X-MC-Unique: rBaKQDM8Oiy08rswZN21sw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAMA9Oxl010359
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] ignore/update integrity checksums
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On Fri, 22 Nov 2019, Erich Eckner wrote:

> Hi,
>
> I have multiple disks with LUKS+integrity created by
>
> cryptsetup luksFormat /dev/sde --key-file /mnt/key/key --integrity=20
> hmac-sha256
>
> which are part of a raid6. Details of the device:
>
> /dev/mapper/leg0 is active.
>  type:    LUKS2
>  cipher:  aes-xts-plain64
>  keysize: 768 bits
>  key location: keyring
>  integrity: hmac(sha256)
>  integrity keysize: 256 bits
>  device:  /dev/sdb
>  sector size:  512
>  offset:  0 sectors
>  size:    11031354576 sectors
>  mode:    read/write
>
>
> Recently, I rebooted this box and apparently, I missed to cleanly sync th=
e=20
> disks, so they now report integrity errors, when mdadm probes (during=20
> assemble) for the raid superblock:
>
> device-mapper: crypt: dm-1: INTEGRITY AEAD ERROR, sector 11031354368
>
> There was no write activity on the raid before the reboot except for a=20
> running
>
> mdadm /dev/md0 --replace /dev/dm-0 --with /dev/dm-1
>
> which of course might have written a lot to all superblocks.
>
> Since I believe, the superblocks should be mostly in-sync (except for=20
> event-counters?): Is there a way to ignore or re-calculate the integrity=
=20
> checks?
>
> Also: What is the correct way to assure, that data has been synced to the=
=20
> disk(s) before switching off power? (If that matters, there is a=20
> raid-controller underneath: "06:00.0 RAID bus controller: Hewlett-Packard=
=20
> Company Smart Array G6 controllers (rev 01)" - but it
> does not actually handle the raid, it only feeds the disks through to the=
 os)=20
> I can execute any command after closing the luks-integrity device, my=20
> question aims at: what should I execute?
>
> regards,
> Erich
>
>
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
>

just a follow-up experimentation with the broken disks:

I noticed /sys/block/dm-0/integrity/read_verify and similar which should=20
manipulate verification upon read and updating upon write, according to

https://github.com/ibuildthecloud/ubuntu-kernel/blob/master/Documentation/b=
lock/data-integrity.txt#L169

However, changing /sys/block/dm-0/integrity/read_verify to 0 (it was at 1=
=20
before) does not change the behaviour: `mdadm --examine` still generates=20
read errors and cannot find its superblock for the corresponding crypt=20
device.

Oh, I just see, that I forgot all the details of my system in the first=20
email - sry! - here it comes:

This box is running arch linux with up-to-date packages.

# uname -a
Linux backup 5.3.12-arch1-1 #1 SMP PREEMPT Wed, 20 Nov 2019 19:45:16 +0000=
=20
x86_64 GNU/Linux

# pacman -Q cryptsetup mdadm
cryptsetup 2.2.2-1
mdadm 4.1-2

regards,
Erich


-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3p92iMrPBP64GmxZCu7JB1Xae1oFAl3Xs8gACgkQCu7JB1Xa
e1qykQ//cTcBJ1NGt2R3Cs23AGwdsUzsqyrf3ahPPWryFvN53GbYT6LOrjCqpF8n
DWNFQ/xBqDwpuQh3l3MatEoaIewGMgkjt2gcpG1aVPnZWJo1hgJDhpXW8locBpN+
h/q8bxcD9nOkMApDwu9bQxLIJcqBZISTgE8QmAvKvXFiPSuh22Gbth6NtSki2G3U
95TPvNbdMJCSG32SEQ1F3/4nky20CMkd31sam44pL//Mr9a6sSeKeaUeQ9rX13Oe
58kmkKp3d8ZIp89ruWgca2wEE5SZA3qdewWs5dfkCnLxzIs8tjL9jfrp1wR+yKNb
DiDj2i203IPxxIgcwu+aDPxboCrJDu3zEE1OcQf6ZDd7nGqsdaf2aGp/F/SkqQ9s
d20+DZSi+2NSQ8n782/zXuroVmy1of4eDn2flFSZFOKfuqgtWcQFnN+JZsZT/bIQ
xNKuD8eIY5lvO58Rpkg38JjIMfVuQiGdjfh1CK/ZUeYOXC6YnGgmOaZqdIWMH4ya
JknY7oXkCluGRNKn3wObufRMa3LkAjoRTmHRw4JpLWJgBxXaj7vsc/thrWy+Uw+3
cmwTMQBR3YttEAYsMRp+s6QNvN6ny3FlNAupnrSTiujjSnO7RZKTV5VeBOcAeoL4
4dTi0FTpehWWA6U3UlmUOafyZjGCHuXDVHKAbVUHiHjQJIpSztw=3D
=3D9Xhi
-----END PGP SIGNATURE-----


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

