Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6FF1068A0
	for <lists+dm-devel@lfdr.de>; Fri, 22 Nov 2019 10:08:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574413692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wNkB8u6XsN4DpTUyApQXoAEXdW9W3oMQd/LFMAAHPOc=;
	b=U2iDAXuQn580mdI5oCH50YDKffgqf51pcq/S8gm/4cyVeoyX0kwa7PoLK1D4v/4w5NLkUN
	Z5+jr2NMdSo26MEoXiUWlJqfIpPX7/A7+ugqfRa/MXBTyskcZhNb6pm5xlc6OGCjdcmwZS
	I58A7NWtMkxImV1ThenKvlQa8c6RVTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-Xgfh3HPHP6afgS8IKv7VKg-1; Fri, 22 Nov 2019 04:08:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A4EEDB4A;
	Fri, 22 Nov 2019 09:07:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 687CB5F700;
	Fri, 22 Nov 2019 09:07:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 606CF4BB65;
	Fri, 22 Nov 2019 09:07:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM97PSY008713 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 04:07:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EE4702166B2A; Fri, 22 Nov 2019 09:07:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E80602157F44
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 09:07:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C208F8007D9
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 09:07:22 +0000 (UTC)
Received: from szilassi.eckner.net (szilassi.eckner.net [193.30.121.109])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-269--hP-HQN4MImp2Y2g4WmkDQ-1; Fri, 22 Nov 2019 04:07:20 -0500
Received: from nlopc43.ioq.uni-jena.de (musketeer-15.fusion.uni-jena.de
	[::ffff:141.35.40.15]) (AUTH: PLAIN erich@eckner.net, )
	by szilassi.eckner.net with ESMTPSA
	id 0000000000760301.000000005DD7A547.0000F351;
	Fri, 22 Nov 2019 10:07:19 +0100
Date: Fri, 22 Nov 2019 10:07:14 +0100 (CET)
From: Erich Eckner <device-mapper@eckner.net>
X-X-Sender: erich@nlopc43.ioq.uni-jena.de
To: dm-devel@redhat.com
Message-ID: <alpine.LNX.2.21.99999.375.1911221006490.1609868@nlopc43.ioq.uni-jena.de>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
Mime-Version: 1.0
X-MC-Unique: -hP-HQN4MImp2Y2g4WmkDQ-1
X-MC-Unique: Xgfh3HPHP6afgS8IKv7VKg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM97PSY008713
X-loop: dm-devel@redhat.com
Subject: [dm-devel] ignore/update integrity checksums
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

I have multiple disks with LUKS+integrity created by

cryptsetup luksFormat /dev/sde --key-file /mnt/key/key --integrity hmac-sha=
256

which are part of a raid6. Details of the device:

/dev/mapper/leg0 is active.
   type:    LUKS2
   cipher:  aes-xts-plain64
   keysize: 768 bits
   key location: keyring
   integrity: hmac(sha256)
   integrity keysize: 256 bits
   device:  /dev/sdb
   sector size:  512
   offset:  0 sectors
   size:    11031354576 sectors
   mode:    read/write


Recently, I rebooted this box and apparently, I missed to cleanly sync the=
=20
disks, so they now report integrity errors, when mdadm probes (during=20
assemble) for the raid superblock:

device-mapper: crypt: dm-1: INTEGRITY AEAD ERROR, sector 11031354368

There was no write activity on the raid before the reboot except for a=20
running

mdadm /dev/md0 --replace /dev/dm-0 --with /dev/dm-1

which of course might have written a lot to all superblocks.

Since I believe, the superblocks should be mostly in-sync (except for=20
event-counters?): Is there a way to ignore or re-calculate the integrity=20
checks?

Also: What is the correct way to assure, that data has been synced to the=
=20
disk(s) before switching off power? (If that matters, there is a=20
raid-controller underneath: "06:00.0 RAID bus controller: Hewlett-Packard=
=20
Company Smart Array G6 controllers (rev 01)" - but it
does not actually handle the raid, it only feeds the disks through to the=
=20
os) I can execute any command after closing the luks-integrity device, my=
=20
question aims at: what should I execute?

regards,
Erich


-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3p92iMrPBP64GmxZCu7JB1Xae1oFAl3XpUQACgkQCu7JB1Xa
e1ry/hAAsWBT+D4UgVEbLNQj8s2cpFP8z4iTfT2vTG9UeEilxjpxrU5tPcRGKANv
qewyTwC5JrH6Mst3AE6P+ToSUWisMOcUXSg663dh4q8lmJjL/IdBrTU6cMqrFJV/
QXx3crf3j6soZ9AXSQgGRJm0wIV24WKg5vgTTDug56TR0ifUK+KJrWsqtforhtYu
hynMYlMHOcYUX4aPRHL6M56K9dSt92/9i5oRcm+jmKKSnTceJHduSD4RPMs93Lb9
JYIef1Qg+0wZqPZr1JD5AR+IU4J4dvysiqP9H3XYNIZaGYo2dGI6q6+6ksuGDxDu
sCeMFNlOdftptC8HlVUm29sERNEXqN+cWZ5X9OdEPKPuY+fQtF4vugy9rRcw+Q41
FHLGs5Aip/jGbXxh0vtOflcpZF4O4j4mu5r0KWEh1YgMIOb+JeWueGamSCdvb0yP
p/ZwfCM0a3sncOw5YRIIS6YXshCl57xzgRv326Z199Y9uROAd0pGvW2B91pKS2QM
W++AaEozRAT5X/5PSSJpw9bx2iprS6YwkygCeFuIswcrMfvbaiwBdXeIVvPZRJjO
lTVMnxWIqt3zkDWaZdwJzQCFycLtlGGXlei4Y3TCBfwRRGBWj6iLRY6t7SlKX9ST
7KHoha1dp2EheKJV6eZXo0mxrF7bt6gcPeVpPZIKKGJG5XkgHMA=3D
=3DVedA
-----END PGP SIGNATURE-----


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

