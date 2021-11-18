Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95230455F60
	for <lists+dm-devel@lfdr.de>; Thu, 18 Nov 2021 16:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637249081;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ORlBN6Cj5r1LJM1QhRX31pS5qO7Zn6iQ0PE1j6YtmIg=;
	b=B6giSDYKeQDbY0W6I/5sqqjGZJ3BG1jRNXSrJY289jKQF4T9O7RILbcCAqIPGPC9j0kR6v
	Djx65K6CpnXNgBfKcMCEA9qxJwZaGuAOD9NQn9AsN698kdZUVDhNVgePN1uMeuaF++bec9
	LS/tcpNqyk5QV4T/nyKS3XZCVN9PQn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-Hb1D_8VcPY2d4Tkvhx5RDA-1; Thu, 18 Nov 2021 10:24:39 -0500
X-MC-Unique: Hb1D_8VcPY2d4Tkvhx5RDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3F851923761;
	Thu, 18 Nov 2021 15:24:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6978F19733;
	Thu, 18 Nov 2021 15:24:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3846A180BAD1;
	Thu, 18 Nov 2021 15:24:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AIFOQYm021761 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Nov 2021 10:24:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A4A7419733; Thu, 18 Nov 2021 15:24:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A6BE19D9B;
	Thu, 18 Nov 2021 15:24:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AIFOOpU010924; 
	Thu, 18 Nov 2021 09:24:24 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AIFON97010923;
	Thu, 18 Nov 2021 09:24:23 -0600
Date: Thu, 18 Nov 2021 09:24:23 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211118152423.GG19591@octiron.msp.redhat.com>
References: <1637194052-5985-1-git-send-email-bmarzins@redhat.com>
	<84a3edae8bc303e37d01c7def1f091c208117100.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <84a3edae8bc303e37d01c7def1f091c208117100.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 0/4] Add "reconfigure all" multipath
	command
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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

On Thu, Nov 18, 2021 at 02:56:15PM +0000, Martin Wilck wrote:
> On Wed, 2021-11-17 at 18:07 -0600, Benjamin Marzinski wrote:
> > This patchset is supposed to replace Martin's
> >=20
> > multipathd: add "force_reconfigure" option
> >=20
> > patch from his uxlsnr overhaul patchset. It also makes the default
> > reconfigure be a weak reconfigure, but instead of adding a
> > configuration
> > option to control this, it adds a new multipathd command,
> > "reconfigure all", to do a full reconfigure. The HUP signal is left
> > doing only weak reconfigures.
> >=20
> > In order to keep from having two states that are handled nearly
> > identically, the code adds an extra variable to track the type of
> > configuration that was selected, but this could easily be switch to
> > use a new DAEMON_CONFIGURE_ALL state instead.
> >=20
> > The final patch, that added the new command, is meant to apply on top
> > of
> > Martin's changed client handler code. I can send one that works with
> > the
> > current client handler code, if people would rather review that.
> >=20
> > Changes from v2 as suggested by Martin Wilck:
> > 0003: configure() and enable_delayed_reconfig() directly access
> > reload_type, instead of having the value passed in.
> > schedule_reconfigure() takes an enum force_reload_types instead of a
> > bool
> > 0004: Modified to deal with schedule_reconfigure() changes.
> >=20
> > Changes from v1 as suggested by Martin Wilck:
> >=20
> > 0001: update libmultipath.version to handle ABI change in struct config
> > 0003: Clarify commit message
> >=20
> > Benjamin Marzinski (4):
> > =A0 multipathd: move delayed_reconfig out of struct config
> > =A0 multipathd: remove reconfigure from header file.
> > =A0 multipathd: pass in the type of reconfigure
> > =A0 multipathd: add "reconfigure all" command.
> >=20
> > =A0libmpathpersist/libmpathpersist.version | 12 ++--
> > =A0libmultipath/config.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 1 -
> > =A0libmultipath/configure.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 2 +-
> > =A0libmultipath/libmultipath.version=A0=A0=A0=A0=A0=A0 | 22 +++----
> > =A0multipath/main.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 2 +-
> > =A0multipathd/cli.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 1 +
> > =A0multipathd/cli.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 2 +
> > =A0multipathd/cli_handlers.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
| 12 +++-
> > =A0multipathd/main.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 | 84 +++++++++++++++----------
> > =A0multipathd/main.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 3 +-
> > =A0multipathd/multipathd.8=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 10 ++-
> > =A011 files changed, 88 insertions(+), 63 deletions(-)
> >=20
>=20
> For the series:
>=20
> Reviewed-by: Martin Wilck <mwilck@suse.com>
>=20
> The fact that this is based on my uxlsnr series and that I'm still
> working on the latter has required minor rebasing on my part.
>=20
> Also, my late ABI check has turned out that my patch "add optional
> wakeup functionality to lock.c" was actually a major, not minor, ABI
> change (offsets in "struct vectors" changed).
>=20
> Unless you object, I'll resubmit these, rebased and with the library
> versions ultimately fixed, when I submit the uxlsnr series.
>=20

Sure.

-Ben

> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

