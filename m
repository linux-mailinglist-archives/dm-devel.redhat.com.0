Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A00AF6845E
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jul 2019 09:29:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76AEF308A958;
	Mon, 15 Jul 2019 07:29:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C893D5D705;
	Mon, 15 Jul 2019 07:28:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C393018033A0;
	Mon, 15 Jul 2019 07:28:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6CGMS1O020035 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 12 Jul 2019 12:22:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27DCF5D739; Fri, 12 Jul 2019 16:22:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22A355D756
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 16:22:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04E1281F10
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 16:22:25 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id v19so9493477wmj.5
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 09:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version;
	bh=kBvvFoJHBxn8nsX8fLHT2nytm1V/97+8M6DO1TKeHXA=;
	b=jrXsHpRVSWgVxcogXe52xVuHVHna6tIHaLxXEoBTj5RSO4cbVI8XoiTPX0LkGQOOMK
	H4epy2O7EZ9FPOCcWRCvf7CmQKOjVuA9JLtpRQjXxlDuginG0H3I0OEmk03i5jdX9z32
	3GAMdVhFwse8QiFUoj1qlYOAayY5CSU5LX5Lj4DCtjbKumfofps0QT5xkVOy9m9tivrf
	OGCeMWEesoaigPiveyJZlSIUU1khUQjdOPxoABl/8Ue+vhyIizdPqKTOGyrCptt2f/bw
	U9Qg5rQG5GVlbaYrpvNN7Sf9l/JEcOVmBdNiZnmQ+NfByJVfqMr+YE1pSomfdVFffCCx
	8SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version;
	bh=kBvvFoJHBxn8nsX8fLHT2nytm1V/97+8M6DO1TKeHXA=;
	b=YvDAlTCLzDC5gqwr4YsjYBV3N3b/Vs/Zf84EyPIA3rded4gtUmD/3mG2iL6awMgJFm
	yb+/sb0FkhXz9peHpYCa115pFrvettOlko4LbvF5abAeeCEY2zV7lo7jBqnUJoXfOHWL
	23qs7HRnRQhS8IsUdPGo8a/n0pBB3TFghQ+4e62reH7cwGVT2nWAdWCz2/ogxeR072wQ
	480mdEFgfGobglYCV1IPK07hPS3Zm4pwLYFF/RS6gGENEOUllBjRo4HlLnAtEdU4LXzn
	tg1D61d/zBUlOa0qOA3sNQeuHsICHd0n6GJ48B7ia+5Xs/HJMGGyJz7YHxNeYG3/kmM6
	RSsA==
X-Gm-Message-State: APjAAAV700E0Tu2VE0IIamAdhjJobyQeujZ6uFV1PGrlmoajn1AuwcHI
	uxFjy/pnU0Y4i8pyBY4/GMDxzPCRBDo=
X-Google-Smtp-Source: APXvYqwGZypcLrnOOUY/p+hddThxvVPfM4z6BK0AfKUEtNJuKPTcLJdGVCPrf0qyQ7qoKDMIjxyd8w==
X-Received: by 2002:a1c:720e:: with SMTP id n14mr10432053wmc.53.1562948543485; 
	Fri, 12 Jul 2019 09:22:23 -0700 (PDT)
Received: from seagull ([46.231.38.42])
	by smtp.gmail.com with ESMTPSA id 17sm9276567wmx.47.2019.07.12.09.22.22
	for <dm-devel@redhat.com>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 09:22:23 -0700 (PDT)
Date: Fri, 12 Jul 2019 18:22:03 +0200
From: Pellegrino Prevete <pellegrinoprevete@gmail.com>
To: dm-devel@redhat.com
Message-ID: <20190712182203.7c1e3591@seagull>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 12 Jul 2019 16:22:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Fri, 12 Jul 2019 16:22:25 +0000 (UTC) for IP:'209.85.128.51'
	DOMAIN:'mail-wm1-f51.google.com' HELO:'mail-wm1-f51.google.com'
	FROM:'pellegrinoprevete@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.51 mail-wm1-f51.google.com 209.85.128.51
	mail-wm1-f51.google.com <pellegrinoprevete@gmail.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 15 Jul 2019 03:28:28 -0400
Subject: [dm-devel] lvmcache volume gets 100% dirty blocks after power loss
 regardless of previous state
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
Content-Type: multipart/mixed; boundary="===============2831425852437896340=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 15 Jul 2019 07:29:05 +0000 (UTC)

--===============2831425852437896340==
Content-Type: multipart/signed; boundary="Sig_/exE0nx=jtV4S/_jIL7TUM9y";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/exE0nx=jtV4S/_jIL7TUM9y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I have set up a lvmcache lv (on archlinux) using as fast disk the emmc
of my laptop and as slow one a microsd card inserted in the integrated
slot, following the man instructions.

Its dimensions are 10gb and 41gb respectively and I am using this lv
as /home partition.
I used default options, excluding having set 'writeback' as
cachemode.
=20
After I transferred the data (30gb) I noticed that cache used
blocks and cache dirty blocks were now both above 99.94%.

When after some time I tried to turn off the laptop, the shutdown
procedure, being unable to complete the lv unmounting in the time
frame assigned to the task (4m), simply skipped it and the computer was
forced to shut down.

On next boots I found that when not booting in recovery mode the drive
could not be mounted most of the times.

In general, if I shutted down the system before the dirty blocks
percentage went to 0%, it would become 100% all over again at the next
boot.

So I decided to change cachemode to 'writethrough' and wait for the
cache dirty blocks to be zero to see if doing so would solve the
problem.

To my surprise, it took over 24 hours.

With 0% dirty blocks, the system was obviously booting fine.
Also, having previously switched to 'writethrough', I expected in
general not to have dirty blocks at all anymore.=20

Today I forgot to attach the power cable and the laptop shutted
down because of low power.

After this, booting has become difficult again and dirty blocks are
again 99%.

Also, judging from iostat output writes on the sd card (happening in
the background I believe) are really really slow.

I wanted to know:
- if this behaviour is normal,
- if there is a way to avoid it apart from clean shutting downs at 0%
  dirty blocks,
- why do I have dirty blocks in 'writethrough' mode,
- if there is a way to empty the cache without erasing the whole volume,
- if there is a way to trigger the cleaning process directly with an
  'high' priority.

Cheers,
Pellegrino

--Sig_/exE0nx=jtV4S/_jIL7TUM9y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEErBQraTyBRt4W7kAGmR3ZDmkT6/YFAl0os6sACgkQmR3ZDmkT
6/YrwRAAjwHnwtQL8CUEOSkziQHGQdLxaV/aw2KQpz1cYyPsi2vKclr8otE2FKwj
7VtjIFSk3Sm/BUeIKFp5pPCuAJii+kaku036c9Whmud8osgf64pcO+HL63J29fNC
+SPBzDDBQnKc84nIUor2Pdhz9Pp9VMZ5O+H1myrPZhPojZDAZwpbGSR7MAtYkvrJ
AzOi2VlnmZbOqPr83K8o81FNhtZD2pxqd8HUHqzoFcvUvvQdFykKQfs+6aMXI+Mq
Vxcta5vZoGesR3HkOIVI9QKNoZyTBJCL4OTqzUOKDENqqqOO75sKHtZZkGQPQCtZ
hA8fuqX039BYyE0jUlvXKtfzGY3cSyxinpykpzWWKJe0BiaWcv0Q15uUqC7pDoQB
3uWvfyQV6fUNPhLN2lg7FwOQtDHwM9ijjaB+je7gM9CnQmxOXs81+80dZtve8OxR
EfsRD3846Vp/xGMyLhJCRLyFpWyA8TeqxscYCHYS3nDHFkVDZNmSdf9bpZu8uloB
M8y1nCJc9H+nBxoSguwYjb92Lyx3a+9jkeuosTKfkBQvXWlFANOwjb5e8v5fZ3iD
uJLB2S32RThwdXIG8BfSR222Rabk86tvy+7uHy8UsTEJJkliLTiXX8NjhBRAS8k0
FXuVqYuRw0c76H4EO2ghFKYbt2QaOyrRiKGZGwG3wR/YTywjm7U=
=GSnp
-----END PGP SIGNATURE-----

--Sig_/exE0nx=jtV4S/_jIL7TUM9y--


--===============2831425852437896340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2831425852437896340==--

