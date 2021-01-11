Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E37CF2F1E2E
	for <lists+dm-devel@lfdr.de>; Mon, 11 Jan 2021 19:43:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610390609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Smq6IJaHvb1pHi40QuHJ2cUB8QCEWJBYfDj0A8Rw3TY=;
	b=HHEoWrj57Jp2gVN4x6sgKWZXPhhADJikxQIOj40Ueji1MScLyLTteBY4nQUsF9UIVviPC3
	7dWAl2fdg25HZTG0Okq7XPxhTsBmMCSh8eRWlPc/nSgLWpn9AgtaJ9OlpR5qaNZqXz3Vdd
	QkC57N+M4NsyJhfAMFK3mCMR4sMGh7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-vY_ZJd3ENWq1ucu0p5E3Rg-1; Mon, 11 Jan 2021 13:43:26 -0500
X-MC-Unique: vY_ZJd3ENWq1ucu0p5E3Rg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A746100559B;
	Mon, 11 Jan 2021 18:43:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C99AF19D9F;
	Mon, 11 Jan 2021 18:43:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 862D3180954D;
	Mon, 11 Jan 2021 18:42:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10BIgjIa004830 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 13:42:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 238045D762; Mon, 11 Jan 2021 18:42:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D99E5D6A1;
	Mon, 11 Jan 2021 18:42:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 10BIgeZK031295; 
	Mon, 11 Jan 2021 12:42:40 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 10BIgdad031294;
	Mon, 11 Jan 2021 12:42:39 -0600
Date: Mon, 11 Jan 2021 12:42:39 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20210111184239.GV3103@octiron.msp.redhat.com>
References: <3baec678cfdc3c8ed2024b2df2f316d1694fe699.camel@suse.com>
	<CABr-Gnd1TJhd7QSge+vAwrJZSHuUjW7hbKd-sFwx=zdNotv_Eg@mail.gmail.com>
	<85d7c08115fd50c413ddcd957f22f40db2215f19.camel@suse.com>
	<f74cbc725ec8cb75016e8061c46eeb628d30bb25.camel@suse.com>
	<eabe0f24-b32f-ff5f-b808-b2c501263d8f@suse.de>
	<b40493f4316db496e80f2aca8215ac52f5acb99a.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <b40493f4316db496e80f2aca8215ac52f5acb99a.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel mailing list <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] multipath-tools: NEW openSUSE github repo
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:54:01PM +0100, Martin Wilck wrote:
> On Mon, 2021-01-11 at 08:43 +0100, Hannes Reinecke wrote:
> > >=20
> > Looks good to me.
>=20
> OK. I have renamed the repositories now. The new openSUSE repo is now
> reachable as
>=20
> https://github.com/openSUSE/multipath-tools
>=20
> The important branches have been renamed, please update your bookmarks:
>=20
> https://github.com/openSUSE/multipath-tools/tree/fixes
>   (obvious bug fixes, reviewed - Christophe should be able
>    to pull from here any time)
> https://github.com/openSUSE/multipath-tools/tree/queue
>   (less obvious and larger changes reviewed on dm-devel,
>    this is where changes for new releases would be pulled from)
> https://github.com/openSUSE/multipath-tools/tree/tip
>   (active development)
>=20
> We should discuss the git workflow. Until now, I've always rebased my
> branches on Christophe's when pulling. I would like to switch to a
> merge-based workflow for "queue" and "fixes". This would make it easier
> for third parties to pull from these branches.=A0It would mean that
> Christophe's repo won't keep a fully linear history. I'm not sure if
> that matters to anyone, but I wanted to ask anyway. The "tip" branch
> will continue to be rebased (onto "queue").


Souds reasonable.=20

>=20
> As discussed previously, changes regarding the multipath-tools code
> itself will continue to be posted on dm-devel. Other stuff such as
> github-specific changes (e.g. CI) might be handled via github PR,
> without bothering the list, unless anyone objects.

Sure.

-Ben

> The previous openSUSE repo, which will be mostly stale from now on, is
> now found here:
>=20
> https://github.com/openSUSE/multipath-tools-pre2021
>=20
> Regards
> Martin
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

