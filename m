Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9226E1D890F
	for <lists+dm-devel@lfdr.de>; Mon, 18 May 2020 22:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589833453;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qthEVLYg1hDT4Xyjy7vUdwn+/jtWy8qcDNw/KvHCMXY=;
	b=T7JG4U6BvWzT3BLBsP4PkxE6Rvf6/z6KX8AHu5wBUPL1LmFqa7bOi8Zagzl3kXmpXHtKx+
	haZ987XvVnCmT55Vm9O6jOsDZMJ+6G+K1fztvIaHhSDYkyga8W69w/Nrw3YgbZPk07ypoo
	hiaDZwVxjJNH5I/I72KQlT63EomEsoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-JveUQoahNqylXTWZPwL_tg-1; Mon, 18 May 2020 16:24:10 -0400
X-MC-Unique: JveUQoahNqylXTWZPwL_tg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51E8A801E63;
	Mon, 18 May 2020 20:24:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F205510013D9;
	Mon, 18 May 2020 20:23:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C82A04ED3C;
	Mon, 18 May 2020 20:23:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04IKMuYF018777 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 May 2020 16:22:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 078152156A3A; Mon, 18 May 2020 20:22:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0B3D2156A22
	for <dm-devel@redhat.com>; Mon, 18 May 2020 20:22:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC672833B4E
	for <dm-devel@redhat.com>; Mon, 18 May 2020 20:22:53 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1589833373;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	content-type:content-type:in-reply-to:in-reply-to: references:references;
	bh=SLIPOKgRR57nIjkmVNhkY60knUJN/BbrXQM2ntEIqoI=;
	b=lpaMNF0yX3BA9CIhAVQwWkWK3p7oFKtDdVA6dQhRbdoRsJQDqQ1ksKfJcYhiMQ8yza5Ik1
	+rrXstWdl94c+fufSbeOQib3xeNe28JuntiiqO6S9YuKADfbTInl+fNiMGPAHwYoKsAwmp
	9/jRP8MTcrgwxDRdHwNskYDx5Rp8f1NIF4U5Yj7b0J3tpkm275wIh/4FgFxtnkJ+IL54++
	EalPFwrtnktNGSV+GOFuV9Qv1CS3J4CiVagx4xrmFW/wwvlAprgLujf1lTWxKnM3lIZP9E
	nUGzdKRz7PidMHgyFV8S5lIEGoPJnM8fQYbuWlVtI+QKsSROWZLegiwTRI/NJw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1589833373; a=rsa-sha256;
	cv=none;
	b=NFgyF6rj1T63JfnF1g+GTPWNvlibc+BxQIlWLtsmayUFMvqv9s8ji60pOWiDZmD2oL/igG
	hMoHM5r7mawLg77xXfBbDWqTGsLSDdf213p4W93d6vqeyQwDs2YvRs87Suyh5Yabze1qfY
	N211uo6F6Q2Kxm0mpM7aid6kA5Y2syq/eT3rsYU0gmGZSIaV2jIySVfGTk//FJOSiaUhpV
	cSkUkhxciJ6MbkjA+Ujb3IexDIvUHTwlfax+03+hnuuyOgAz48c7iVZk0vFB7RQXU2UwVM
	cumaf6IUGgbAvmIWScH3tDHuAcETbHwAxhwez5gVgf+K3lJnzxzZWRAh/XzoiA==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none;
	dmarc=pass (policy=none) header.from=vt.edu;
	spf=pass (relay.mimecast.com: domain of valdis@vt.edu designates
	198.82.183.121 as permitted sender) smtp.mailfrom=valdis@vt.edu
Received: from omr1.cc.vt.edu (outbound.smtp.vt.edu [198.82.183.121]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-269-pllN3kQcOcOr8WtQmXaO-Q-1; Mon, 18 May 2020 16:22:50 -0400
X-MC-Unique: pllN3kQcOcOr8WtQmXaO-Q-1
Received: from mr1.cc.vt.edu (mail.ipv6.vt.edu
	[IPv6:2607:b400:92:9:0:9d:8fcb:4116])
	by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 04IKMoLo026698
	for <dm-devel@redhat.com>; Mon, 18 May 2020 16:22:50 -0400
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
	[209.85.219.69])
	by mr1.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 04IKMjH3014041
	for <dm-devel@redhat.com>; Mon, 18 May 2020 16:22:50 -0400
Received: by mail-qv1-f69.google.com with SMTP id o7so6334989qvm.15
	for <dm-devel@redhat.com>; Mon, 18 May 2020 13:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
	:mime-version:content-transfer-encoding:date:message-id;
	bh=HCM0z9rljt16BROVf1iAlmj4G0K4AH3m18Cka4/RF1w=;
	b=jSpN/9a1q7nFDQn8JzqScJ/6k0ucHHGx14NGuo/keKvST51/vxkaQFMLFthxHxV+ZX
	O0DJk7A0OqXv9KxoK486vkYnaZ39LmseVqRwWsC3Hir5z7Dv2axftuuotpX7FABx4Tl+
	EMTR77LXGGgCUsUku/ccMo/CrkuJwHiOuKG7yGCdHGpUDvjngihC8gVScMOjkyErC57+
	31XhJj+lZarJd3vM0vx3qCendIKMRAMK+ymAR+CkrBXP9ZBGXzEvho/4B77A2NlwrGqD
	FaI/O5izQcBEDT2Ep3vIcxKktCxLQsNeQziCjKqYsbUHwyseOfMdJe7XsbFYPfOu/fxa
	orlQ==
X-Gm-Message-State: AOAM531urP6qZZTQ97ouIAzp3WfS42U4Y4yn3wX6Dn1VFaxBmnqLj5Jt
	9yT2KHU0wVFwusTPnDZc/Jsy6+cVS8N1qOqj0/VGNJUrGieQjZ3Oh0bU2SL2kPdPv3bO/F8q/Gs
	S6s8dPNlRUJoXe3ahYtShhGc=
X-Received: by 2002:a37:6547:: with SMTP id z68mr17705295qkb.197.1589833364996;
	Mon, 18 May 2020 13:22:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5CNdFEQSK8WWfGbjtmZd6EWpYQj4GLJIi6JCfHh7zXZY77TsLFbZ8OUETO75hTZ3buwp8tw==
X-Received: by 2002:a37:6547:: with SMTP id z68mr17705270qkb.197.1589833364681;
	Mon, 18 May 2020 13:22:44 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:c9e1::359])
	by smtp.gmail.com with ESMTPSA id
	h12sm10341360qtb.19.2020.05.18.13.22.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 May 2020 13:22:43 -0700 (PDT)
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks"
	<Valdis.Kletnieks@vt.edu>
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200518164449.GA24518@redhat.com>
References: <367320.1589627953@turing-police>
	<7bb0d1c8-b164-d5f3-0218-5c71047c3a8c@suse.de>
	<20200518164449.GA24518@redhat.com>
Mime-Version: 1.0
Date: Mon, 18 May 2020 16:22:42 -0400
Message-ID: <74618.1589833362@turing-police>
Authentication-Results: relay.mimecast.com; dkim=none;
	dmarc=pass (policy=none) header.from=vt.edu;
	spf=pass (relay.mimecast.com: domain of valdis@vt.edu designates
	198.82.183.121 as permitted sender) smtp.mailfrom=valdis@vt.edu
X-Mimecast-Spam-Score: 1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] next-20200514 - build issue in
	drivers/md/dm-zoned-target.c
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
Content-Type: multipart/mixed; boundary="===============5965146847594767835=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

--===============5965146847594767835==
Content-Type: multipart/signed; boundary="==_Exmh_1589833361_31675P";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==_Exmh_1589833361_31675P
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 18 May 2020 12:44:49 -0400, Mike Snitzer said:

> Unless I'm missing something it was fixed up with this commit last
> wednesday (13th):
>
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.gi=
t/commit/?h=3Ddm-5.8&id=3D81a3a1453ec4e5da081e1395732801a600feb352

That says:

author=09Nathan Chancellor <natechancellor@gmail.com>=092020-05-13 01:45:22=
 -0700
committer=09Mike Snitzer <snitzer@redhat.com>=092020-05-15 10:29:39 -0400

So it didn't make it into next-0514, which is why I got bit by it.  It's in=
 today's linux-next
and life is good. :)

--==_Exmh_1589833361_31675P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXsLukQdmEQWDXROgAQJj2w//XgM9u5d10BsMq/vpw2IiM1yGckHbK/ar
oGAc7biiwgohYKxuoVDjWaqvxLyWjRKKY51HLw1hW0iW+s6GRkXmJMOiCUIYRUgl
cBJmUKzAUnHuWN2aXTRMk2iMR2cT76ymT/JCgdhl/ohiBIgHg3nhF9+eNLgxme+C
PT9jC+TzcaMMpxwkAgpEVVpYsx+4S+4Y0iIKH/tsTbfMlGaUtBRKx/uiEcnugIP8
VpOGjU6aUwpWNQpztpya2Be8E63mTkHv+QkjIMzt+B8Oo3NzqT4hFkr6X8bQ2Xsb
b7Pd7f5ca2r6g2Y7JOvK2yawZTVoKt57Y3ri/fvaHLL1gk3Nj66D/XLEWtioiEq4
hw4hmCIinwKg1EmWomkgHzaGEylZZIMWRuKcX00JhVqqtM6BEG5rSFC5b67LxARr
BEkrlRCYM4PIaNYGnh7lbwdiwAORk/60JXmlzVq8DyRJXjmNjAGUL5aAIVRsACzN
VY8FWX/KGblmvyp6mkq2CUEa3HAIh2BlUccA+wWJtwQbCtsB87obhcyd60iHso55
apXGB/y3HCKAmyuET/GPGfRPb84RwZR98ylJbhvkU9KHNImaNpQcIJe/kGZUqqWd
5tvPtuWstOixl3czNpAym0S1QGvgqebzKZQAeJPdRNmg8/WSt/LdOXt7Snt8AOss
gikLBdM2Rzs=
=24y2
-----END PGP SIGNATURE-----

--==_Exmh_1589833361_31675P--


--===============5965146847594767835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============5965146847594767835==--

