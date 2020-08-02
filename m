Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED46235957
	for <lists+dm-devel@lfdr.de>; Sun,  2 Aug 2020 18:54:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-j9EAcucNPOO84CRkgSuGtQ-1; Sun, 02 Aug 2020 12:54:28 -0400
X-MC-Unique: j9EAcucNPOO84CRkgSuGtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33C141005510;
	Sun,  2 Aug 2020 16:54:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DB758A176;
	Sun,  2 Aug 2020 16:54:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E80409A0FA;
	Sun,  2 Aug 2020 16:54:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 072GrhJb032407 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 2 Aug 2020 12:53:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C0CC5F277; Sun,  2 Aug 2020 16:53:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 065DD5F274
	for <dm-devel@redhat.com>; Sun,  2 Aug 2020 16:53:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF6C887E8FB
	for <dm-devel@redhat.com>; Sun,  2 Aug 2020 16:53:40 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1596387220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=meqw8ehrrkd/PjvY4AKkmxiknD5SI4QvtSTtX+CnDIM=;
	b=qiZL9/uksU0YOAIHUAX3Pn57o8q3yfHDAOunZoXH/Ef9VNhmCNQGC1APhTtTxOP9/b4Umv
	8cM1/hFEuVej5d63l7SAXD1EU2ZMg8CW3vYMLxM50iH4lpwrlPr6kSpXIYFISLFErvIzau
	rw74q8j6x+5cZ/ItpY/pz9jfxKtUHp9xpzWM3cQ8hjrIZJnBRHFUXjhFmY/jx8MGyphBEx
	Ppv9f9YgxKdKJ+M0Hy4RylPeE2oEAy1Hj5CzgGj3droX26kzuEcdZiyFcDRctCirJrpz5a
	xbqgRelzj9nASPVaTFW9ixvM40nhc6Bgx7IX26jmFbkdvd2H1aL9oY91g8TVKw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1596387220; a=rsa-sha256;
	cv=none;
	b=oxuYxJl3RnfLj0hxUlhoK2kgk2ySxntxf03cZQA1wOkkre16HjPO1XkcbbGL7MR1aUbMiJ
	DP4YwfWFxcN26pfjmvVLExXj7QLd7FKDeJ9nzw4FQt17a/0kXadWsCWUBRjKfAFGCIz+yG
	Aj2wx9WvG9bByG/sBlYIiKR6tlaLvaf/qW4vfByOzKo+VXNRf76Tw0JGrYSYTj1qJQb5Ph
	1CjUeD0sbuHLghtPOAacz7uwqjzH1O8GZLmoLGbRC99y/5PGALN0TkMqTKJL2UNE5gQ07X
	yDsNzVHkFTbfxIxh8KL0Wkw//8JJsBIJBPLKmqkYxbfDiL/fuXwlUNe+pCiilg==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=hansenpartnership.com header.s=20151216
	header.b=FAJShkAZ; 
	dkim=pass header.d=hansenpartnership.com header.s=20151216
	header.b=FAJShkAZ; 
	dmarc=pass (policy=none) header.from=HansenPartnership.com;
	spf=pass (relay.mimecast.com: domain of
	james.bottomley@hansenpartnership.com designates 66.63.167.143
	as permitted sender)
	smtp.mailfrom=james.bottomley@hansenpartnership.com
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-391-J73k0OmOP2SYbaKuXg6zvw-1;
	Sun, 02 Aug 2020 12:53:36 -0400
X-MC-Unique: J73k0OmOP2SYbaKuXg6zvw-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 885DB8EE1D9; 
	Sun,  2 Aug 2020 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1596386609;
	bh=oOhMZH0FB4G6orqdqFAkNZTXeB04XgPNUsm8TD4axsQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FAJShkAZZYyORIkhrqfSw8BqDSP8QlmrngZQFw4ROTqB3PQ+G9V8iksNfVUVn74Xj
	+x8faujRDzZNkaOa4js3O4QsNJo03gHhpNQ1OkoSSrlN9lKDbK5hALrRjPbs1fIY6m
	l1nRpnp3y5eFE5YVTo1Os2MZ6mCFp1ZXz0qKGUoI=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bIfAAv72tOKa; Sun,  2 Aug 2020 09:43:29 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 2357D8EE16A;
	Sun,  2 Aug 2020 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1596386609;
	bh=oOhMZH0FB4G6orqdqFAkNZTXeB04XgPNUsm8TD4axsQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FAJShkAZZYyORIkhrqfSw8BqDSP8QlmrngZQFw4ROTqB3PQ+G9V8iksNfVUVn74Xj
	+x8faujRDzZNkaOa4js3O4QsNJo03gHhpNQ1OkoSSrlN9lKDbK5hALrRjPbs1fIY6m
	l1nRpnp3y5eFE5YVTo1Os2MZ6mCFp1ZXz0qKGUoI=
Message-ID: <1596386606.4087.20.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Pavel Machek <pavel@ucw.cz>, Sasha Levin <sashal@kernel.org>
Date: Sun, 02 Aug 2020 09:43:26 -0700
In-Reply-To: <20200802143143.GB20261@amd>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
Mime-Version: 1.0
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=hansenpartnership.com
	header.s=20151216 header.b=FAJShkAZ;
	dkim=pass header.d=hansenpartnership.com header.s=20151216
	header.b=FAJShkAZ;
	dmarc=pass (policy=none) header.from=HansenPartnership.com;
	spf=pass (relay.mimecast.com: domain of
	james.bottomley@hansenpartnership.com designates 66.63.167.143
	as permitted sender)
	smtp.mailfrom=james.bottomley@hansenpartnership.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com, paul@paul-moore.com,
	corbet@lwn.net, jmorris@namei.org, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, viro@zeniv.linux.org.uk,
	axboe@kernel.dk, mdsakib@microsoft.com,
	linux-kernel@vger.kernel.org, eparis@redhat.com,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
 LSM (IPE)
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
Content-Type: multipart/mixed; boundary="===============4972331322675034548=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

--===============4972331322675034548==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MrVpu3P/x22sFTzai/hX"

--=-MrVpu3P/x22sFTzai/hX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-08-02 at 16:31 +0200, Pavel Machek wrote:
> On Sun 2020-08-02 10:03:00, Sasha Levin wrote:
> > On Sun, Aug 02, 2020 at 01:55:45PM +0200, Pavel Machek wrote:
> > > Hi!
> > >=20
> > > > IPE is a Linux Security Module which allows for a configurable
> > > > policy to enforce integrity requirements on the whole system.
> > > > It attempts to solve the issue of Code Integrity: that any code
> > > > being executed (or files being read), are identical to the
> > > > version that was built by a trusted source.
> > >=20
> > > How is that different from security/integrity/ima?
> >=20
> > Maybe if you would have read the cover letter all the way down to
> > the 5th paragraph which explains how IPE is different from IMA we
> > could avoided this mail exchange...
>=20
> "
> IPE differs from other LSMs which provide integrity checking (for
> instance,
> IMA), as it has no dependency on the filesystem metadata itself. The
> attributes that IPE checks are deterministic properties that exist
> solely
> in the kernel. Additionally, IPE provides no additional mechanisms of
> verifying these files (e.g. IMA Signatures) - all of the attributes
> of
> verifying files are existing features within the kernel, such as
> dm-verity
> or fsverity.
> "
>=20
> That is not really helpful.

I think what the above is trying to to is to expose is an IMA
limitation that the new LSM fixes.  I think what it meant to say is
that IMA uses xattrs to store the signature data which is the "metadata
dependency".  However, it overlooks the fact that IMA can use appended
signatures as well, which have no metadata dependency, so I'm not sure
I've helped you understand why this is different from IMA.

Perhaps a more convincing argument is that IMA hooks into various
filesystem "gates" to perform integrity checks (file read and file
execute being the most obvious).  This LSM wants additional gates
within device mapper itself that IMA currently doesn't hook into.

Perhaps the big question is: If we used the existing IMA appended
signature for detached signatures (effectively becoming the
"properties" referred to in the cover letter) and hooked IMA into
device mapper using additional policy terms, would that satisfy all the
requirements this new LSM has?

James

--=-MrVpu3P/x22sFTzai/hX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCXybtLgAKCRDnQslM7pis
hWimAP9T9I/4sBSeBrGI7NqoyKwG2H+cwtXr/XrBRxwSXraDUgD/TFHreLGqN12U
JeJ3dF9i/fLU2fxGJpJrexE3/T8J3AQ=
=Q5Lc
-----END PGP SIGNATURE-----

--=-MrVpu3P/x22sFTzai/hX--


--===============4972331322675034548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============4972331322675034548==--

