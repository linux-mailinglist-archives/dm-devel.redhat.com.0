Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BCFD1108AF1
	for <lists+dm-devel@lfdr.de>; Mon, 25 Nov 2019 10:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574674375;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jnMi8eqhfasPJSOtThf6puJoWj06wF8eBMy9ciyVzOY=;
	b=LbrGQvZ73iNnrtuvyYzLO8MKKTAAxTKuLO33OmBGMEZKjXOFqMEs/VOQeig7+oYbKvbA0+
	/gf9zM4NYkBMgY7orA0E+Ve7TsXQnLLt1PgixBXnCZlu2ki1eNpiMm+IvzUH8f0BEGs7GQ
	Lm2WsVttvAUZvUUBkZB1MckY0rvWsCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-G-30F2N-NSeCI_MOB0FLPw-1; Mon, 25 Nov 2019 04:32:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7DF8107ACE3;
	Mon, 25 Nov 2019 09:32:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7759660C81;
	Mon, 25 Nov 2019 09:32:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FABE4BB65;
	Mon, 25 Nov 2019 09:32:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM8xSMK008467 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 03:59:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 205EE2031A5E; Fri, 22 Nov 2019 08:59:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 194312037D51
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 08:59:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1D5A8871F4
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 08:59:25 +0000 (UTC)
Received: from szilassi.eckner.net (szilassi.eckner.net [193.30.121.109])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-141-Ylzg1g70MV20F4Az7qEWfA-1; Fri, 22 Nov 2019 03:59:23 -0500
Received: from nlopc43.ioq.uni-jena.de (musketeer-15.fusion.uni-jena.de
	[::ffff:141.35.40.15]) (AUTH: PLAIN erich@eckner.net, )
	by szilassi.eckner.net with ESMTPSA
	id 00000000007602FF.000000005DD7A23B.0000E519;
	Fri, 22 Nov 2019 09:54:19 +0100
Date: Fri, 22 Nov 2019 09:54:13 +0100 (CET)
From: Erich Eckner <device-mapper@eckner.net>
X-X-Sender: erich@nlopc43.ioq.uni-jena.de
To: dm-devel@redhat.com
Message-ID: <alpine.LNX.2.21.99999.375.1911220937550.2770450@nlopc43.ioq.uni-jena.de>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
Mime-Version: 1.0
X-MC-Unique: Ylzg1g70MV20F4Az7qEWfA-1
X-MC-Unique: G-30F2N-NSeCI_MOB0FLPw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM8xSMK008467
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 25 Nov 2019 04:27:13 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

I have multiple disks with LUKS+integrity created by

cryptsetup luksFormat /dev/sde --key-file /mnt/key/key --integrity hmac-sha256

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


Recently, I rebooted this box and apparently, I missed to cleanly sync the 
disks, so they now report integrity errors, when mdadm probes (during 
assemble) for the raid superblock:

device-mapper: crypt: dm-1: INTEGRITY AEAD ERROR, sector 11031354368

There was no write activity on the raid before the reboot except for a 
running

mdadm /dev/md0 --replace /dev/dm-0 --with /dev/dm-1

which of course might have written a lot to all superblocks.

Since I believe, the superblocks should be mostly in-sync (except for 
event-counters?): Is there a way to ignore or re-calculate the integrity 
checks?

Also: What is the correct way to assure, that data has been synced to the 
disk(s) before switching off power? (If that matters, there is a 
raid-controller underneath: "06:00.0 RAID bus controller: Hewlett-Packard 
Company Smart Array G6 controllers (rev 01)" - but it does not actually 
handle the raid, it only feeds the disks through to the os) I can execute 
any command after closing the luks-integrity device, my question aims at: 
what should I execute?

regards,
Erich

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3p92iMrPBP64GmxZCu7JB1Xae1oFAl3XojcACgkQCu7JB1Xa
e1q17g//TCKyH5US3c5j+FHH/90gsAoW8LuMzeIV3KnswtJm1fA/lWhbJMbKG/8r
eo1P48wOKLRTNT5RJV+M3+we/80la/x6PGl2IM/WXTGT8TAdOISKksifzJ7/wXhd
UxIjzhenc2mFnpYjrMABY3BYGvJf7AkrmrmliGe/BO9sMKej6R1WlE17ZOD+sGFN
/FWLPtgcBcfVFNk+tn2aUa6oovLxpzzhYUcktuqpI0WQOOydQwRsb3sIM0bYHpNZ
99ieIHyIDY7p0V/Ym0Msm/ic1PIzsPtWl6MiRmzjXf8v0UVVFKb23kuPxXHKEBLV
5u/DOzbrBpT+w5hI8eUk5me/qUPWEnrY/4AodZEJxwOpbeqOEbLPa15cPxwT5s3b
+45mpf0raREAI4WANNym5FmAxVukaQKaEGJ7Q8AyVJtN76oGaPNhxEQ4BDxQXOsV
RituTR17MULV80jpVS2atwRNkged9H6aRaDtcmrkx2qyaAHSLghXTLySID9XumbW
pkH45nWvsU1z8t8Lvxy81CrMnB8cmy6Iud3yH1WVKvCnjqmbSZQ4FMXw0fiAas+C
Q1ipkMdKg2mgLUQCRgwWpbvtVR14kZnQjZoPAhOTzbGaYTRbaEPkOMoKqCRStUkb
3l+Hg+AGeP9CR19sFYoR2HSnJGdeK/kYUEBuNfHrOjop2yi+lZY=
=aG59
-----END PGP SIGNATURE-----


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

