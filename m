Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B27B4FBD
	for <lists+dm-devel@lfdr.de>; Tue, 17 Sep 2019 15:56:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EEAEB3086222;
	Tue, 17 Sep 2019 13:56:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EF6E5D6B2;
	Tue, 17 Sep 2019 13:56:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88ABC4EDA6;
	Tue, 17 Sep 2019 13:56:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8HDuXam003586 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 09:56:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 140C8196AE; Tue, 17 Sep 2019 13:56:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 095913D99
	for <dm-devel@redhat.com>; Tue, 17 Sep 2019 13:56:29 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF065796EE
	for <dm-devel@redhat.com>; Tue, 17 Sep 2019 13:56:29 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id k22so4296368qtm.7
	for <dm-devel@redhat.com>; Tue, 17 Sep 2019 06:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y+HmbYPAM8mDn6TAl3LhUGDS2AMVv0hIm7U4DupCodo=;
	b=YG0NSFhL5aqryAMzfRDTT+a5YmFOaCjmr9b/ur+NNXVUxeGpUe4IUTcOhwLEjD5Tmm
	FkWCrum55cQDDjgMm/2LLcgHlSGuZ8QGxFHHsC6bBULoVbEZR0is3pegtgdgpMNeF0+i
	4vHAE1duR0siCvrF/ofGqjjGoHqRsBJBVOOg9uJ5rBlryabKHTdTBBnGoHGVIz4QjSMQ
	BBzPMwHceyVWTaT5gVZZjGFpB7QCa0zhIwuVv0Gf9/3vDn4TUuUkuApc7AnIENn7ShKN
	Voz1VOQ2J56rniLqzzK//lHUDxbSWavVCcIb9Z4LajKFso223OIvqO3VtzwPl3/9/Ys4
	k0jQ==
X-Gm-Message-State: APjAAAWxpM9FU4layGoXyR6ffcvJo3sUh2f/NtcxAgcUtFCNlw3NxOVt
	Ak3S4x+k4Zr0NT35G6qfoSEaK3ZtpIb4WgFHDdUL9OftsOHgLx8f2et8VYU93QT4maF/xagGf12
	D7uh+PwLxrr+wbFiVEixonU/TduQoBFM=
X-Received: by 2002:ae9:c214:: with SMTP id j20mr2952121qkg.498.1568728588808; 
	Tue, 17 Sep 2019 06:56:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsx0iZPgU2FDJ9LD/1qqDsOffPCxF2oADwz+rOnY9XTQY13dkxril7DJemIP3nkedbAWpTRY55RS2jgTQ9uwA=
X-Received: by 2002:ae9:c214:: with SMTP id j20mr2952109qkg.498.1568728588615; 
	Tue, 17 Sep 2019 06:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
	<20190916180107.GA725@infradead.org>
	<127b8c4e-a6dc-6d5e-caff-fe1a0ca3a5bb@gmail.com>
In-Reply-To: <127b8c4e-a6dc-6d5e-caff-fe1a0ca3a5bb@gmail.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Tue, 17 Sep 2019 09:56:17 -0400
Message-ID: <CAMeeMh9t4LBwJn_CPQgFNa_Tyj22fJYHK-4qAnyn0RXm9RzCnw@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, lvm-devel@redhat.com,
	Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm: introduce DM_GET_TARGET_VERSION
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
Content-Type: multipart/mixed; boundary="===============3403680359777632028=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 17 Sep 2019 13:56:50 +0000 (UTC)

--===============3403680359777632028==
Content-Type: multipart/alternative; boundary="000000000000461cf00592c016e6"

--000000000000461cf00592c016e6
Content-Type: text/plain; charset="UTF-8"

I'm confused here:
>...and then it fails on activation because DM table load detects old (or
missing) dm-crypt feature.
>(There was no way to get dm target version before table load if module is
not loaded.)
>And I tried to avoid modprobe calls from libcryptsetup.

I'm not understanding how this could work. Let's say there's a module
providing target 'splice' which is currently unloaded. Then `dmsetup
target-version splice` is unaware of the splice target, and thus reports
nothing. So in order to get the proper version number, we do have to do a
modprobe first.
But, if the module providing splice *is* already loaded, `dmsetup targets`
will report splice's version number already, so `dmsetup target-version
splice` is a convenience instead of parsing `dmsetup targets` output?

--000000000000461cf00592c016e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I&#39;m confused here:<br>&gt;...and then=
 it fails on activation because DM table load detects old (or missing) dm-c=
rypt feature.<br>&gt;(There was no way to get dm target version before tabl=
e load if module is not loaded.)<br>&gt;And I tried to avoid modprobe calls=
 from libcryptsetup.<br><br></div><div>I&#39;m not understanding how this c=
ould work. Let&#39;s say there&#39;s a module providing target &#39;splice&=
#39; which is currently unloaded. Then `dmsetup target-version splice` is u=
naware of the splice target, and thus reports nothing. So in order to get t=
he proper version number, we do have to do a modprobe first. <br>But, if th=
e module providing splice *is* already loaded, `dmsetup targets` will repor=
t splice&#39;s version number already, so `dmsetup target-version splice` i=
s a convenience instead of parsing `dmsetup targets` output?<br><br><br></d=
iv></div>

--000000000000461cf00592c016e6--


--===============3403680359777632028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============3403680359777632028==--

