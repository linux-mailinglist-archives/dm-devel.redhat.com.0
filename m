Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C54731C668
	for <lists+dm-devel@lfdr.de>; Tue, 14 May 2019 11:49:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E861A307D960;
	Tue, 14 May 2019 09:49:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA9281001DC2;
	Tue, 14 May 2019 09:49:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43C3A41F58;
	Tue, 14 May 2019 09:49:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4E9mwXC017231 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 May 2019 05:48:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD5BC5D729; Tue, 14 May 2019 09:48:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8CFE5D964
	for <dm-devel@redhat.com>; Tue, 14 May 2019 09:48:56 +0000 (UTC)
Received: from szilassi.eckner.net (szilassi.eckner.net [193.30.121.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A1E7C056807
	for <dm-devel@redhat.com>; Tue, 14 May 2019 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=eckner.net;
	s=szilassi; t=1557827332;
	bh=IJxFIOhwLjnw3ZO6IJg69tb+x9uT6fe9/xFDyegOAps=; l=2693;
	h=Date:From:To:Subject;
	b=NoNELXVuxk7aQrXVphGWGh09OhT3H12SsMcVz7B/Y22Bx5WmykxIcOWUF4lAELb9N
	BRHPMo2GqvmVkjcCoerjhBh/cEvChsNCzmAlb+Xvr15LkVD7tWvCu/znEFDgyFMq9p
	Vpn+gaSAu+yv1+49YQPzB0s2jzX8gZJIJH1orMrpik3AP8D/Zetuz+YeRQgH1ZY7qp
	atg1FcLYQRza3GsSqk9z9vUme+5QbnXTp+kBKiJnmBiT837WujMaTZ1iiaf2rLHDVA
	9mZZ/WLUxSLadUu9yev+0Ncxpvnai2N9I5bXynF8A1Gnou8C/T/LkklkW5GmqFhvPC
	8aB0txLavN0eg==
Received-SPF: none (Address does not pass the Sender Policy Framework)
	SPF=HELO; sender=nlopc43.ioq.uni-jena.de;
	remoteip=::ffff:141.35.50.156;
	remotehost=nlopc43.ioq.uni-jena.de; helo=nlopc43.ioq.uni-jena.de;
	receiver=szilassi.eckner.net;
Received-SPF: fail (Address does not pass the Sender Policy Framework)
	SPF=MAILFROM; sender=device-mapper@eckner.net;
	remoteip=::ffff:141.35.50.156;
	remotehost=nlopc43.ioq.uni-jena.de; helo=nlopc43.ioq.uni-jena.de;
	receiver=szilassi.eckner.net;
Received: from nlopc43.ioq.uni-jena.de (nlopc43.ioq.uni-jena.de
	[::ffff:141.35.50.156]) (AUTH: CRAM-MD5 erich@eckner.net, )
	by szilassi.eckner.net with ESMTPSA
	id 0000000000860002.000000005CDA8F04.00001D46;
	Tue, 14 May 2019 11:48:52 +0200
Date: Tue, 14 May 2019 11:48:46 +0200 (CEST)
From: Erich Eckner <device-mapper@eckner.net>
X-X-Sender: erich@nlopc43.ioq.uni-jena.de
To: dm-devel@redhat.com
Message-ID: <alpine.LNX.2.21.9999.1905141138180.19368@nlopc43.ioq.uni-jena.de>
User-Agent: Alpine 2.21.9999 (LNX 339 2019-05-08)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="596483122-1015369343-1557827332=:19368"
Received-SPF: fail (Address does not pass the Sender Policy Framework)
	SPF=FROM; sender=device-mapper@eckner.net;
	remoteip=::ffff:141.35.50.156;
	remotehost=nlopc43.ioq.uni-jena.de; helo=nlopc43.ioq.uni-jena.de;
	receiver=szilassi.eckner.net;
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Tue, 14 May 2019 09:48:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Tue, 14 May 2019 09:48:55 +0000 (UTC) for IP:'193.30.121.109'
	DOMAIN:'szilassi.eckner.net' HELO:'szilassi.eckner.net'
	FROM:'device-mapper@eckner.net' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	SPF_HELO_PASS,
	SPF_PASS) 193.30.121.109 szilassi.eckner.net 193.30.121.109
	szilassi.eckner.net <device-mapper@eckner.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Subject: [dm-devel] add identifying information in INTEGRITY AEAD ERROR
	message
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 14 May 2019 09:49:22 +0000 (UTC)

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--596483122-1015369343-1557827332=:19368
Content-Type: text/plain; format=flowed; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

I have a bunch of dm integrity devices tied together to an md raid. Now I 
see the following error message in dmesg:

device-mapper: crypt: INTEGRITY AEAD ERROR, sector 1109341168

repeated a couple of times every few seconds in a row with differing 
sector numbers. There are no other errors in dmesg next to these. As I 
understand, this means, one of the drives deliveres garbage to the 
integrity device which hence issues a read error. (There is an e2fsck 
running on the raid which generates a lot of disk i/o.) That's good - it's 
exactly what I intended this integrity thing for.

My problem now is, that I would like to find out which of my 10 drives is 
the bad one. Is there any way to get some identifying information (a uuid, 
the name of the device in /dev/mapper/, ...)?

ah, the usual statistics:
> uname -a
Linux fileserver 5.1.0 #56 SMP Tue May 7 06:24:43 CEST 2019 x86_64 
Intel(R) Pentium(R) CPU G2020 @ 2.90GHz GenuineIntel GNU/Linux
> zgrep INTEGRITY /proc/config.gz
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_DM_INTEGRITY=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
CONFIG_INTEGRITY_AUDIT=y

The kernel is manually compiled - I'm happy to activate any options you 
deem necessary.

regards,
Erich Eckner
Friedrich-Schiller-Universität Jena
Institut für Optik und Quantenelektronik
Helmholtzweg 4
07743 Jena

Tel. +49 3641 9-47238

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3p92iMrPBP64GmxZCu7JB1Xae1oFAlzajwAACgkQCu7JB1Xa
e1rQ2g/9HVoQcSwhKxLW6w7wy8rgUlHBt/DbWxeHM6KTkss5yxrVNUkv1TGXop9l
krDMKvhpNxI29IrhvSgqSbtJw0sk9iJU0urFsrs09TK6ATvcUtO5X8CLnPULqBqC
YnnygcBgVt16FgoaAMVSyx2qEGrO5DXzquqLlJAa2z0+ZZGWa/5Nrhm3nfbHBbQQ
pjiNpk+iNVbGIhe8+tR+vOZfJaghrA3B9W7FyYARlfB1Gy4S/DM5im2HTw/2ESJp
nkSprpxiq5WyN56tFKnCrZSwe2Ga4NCNP6h8Gz7ynKlpbziXMey8BP3Puvfh7UNa
Blcz648/3RwqfKkGqrY2mypo6DyiWribHr0A8Uza/RWVERbg0U9o1DdZ6DKbbnSm
MKfAuSKBE2WErHrfwNN7WGOK/xlonkR8oADcaLI8db1Xu4Stj1HqA5lB9aT+K9KP
kJFnc1254qJ+LvQHJfPTsW8sKgqwIfccNONltta/BCJCgcDl79y0VL9WX/dJS6Pu
xqSSejPJ7Fp+gpR+FZbllWn+rCGF+JY6dku5oObp5uZOlfwQg8+zAhf4TQLYJmn0
dzgaqonpzzmEGHUw31/R2Km0aHtuEsTCW986Gx9taWY84JyQDRSXjAXHsxJCMtN3
rpMbDemoSRz6/WnI48VauN2obeUS3dmQraV+MNPpGiJmt86XM0o=
=YfBa
-----END PGP SIGNATURE-----
--596483122-1015369343-1557827332=:19368
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--596483122-1015369343-1557827332=:19368--

