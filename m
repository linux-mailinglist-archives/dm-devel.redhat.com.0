Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A24C634D8E2
	for <lists+dm-devel@lfdr.de>; Mon, 29 Mar 2021 22:12:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617048761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AJy0YnHsb+YLAouEkLkTbLMkLfwTTODJWVmWz1+we6k=;
	b=eZY6GORpRxcfDem451XRLpqkbCfUnDexsmAqRxIn5EW0j5BB50G961m4JrJCFDvbqp/B4b
	R7e5JgTbeuihB3ZX5zqZfxfyNKnSWAubP6xJvHftoZqxSNdM1gr4vnWha95kFehal07TpJ
	gOhlve007t7N8jsvk6uupO0ve1OhYss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-4iAR5u59M7-t-Ow3FYIV6Q-1; Mon, 29 Mar 2021 16:12:39 -0400
X-MC-Unique: 4iAR5u59M7-t-Ow3FYIV6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D76BC1084C8C;
	Mon, 29 Mar 2021 20:12:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53B1B5D9F0;
	Mon, 29 Mar 2021 20:12:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 008B31809C83;
	Mon, 29 Mar 2021 20:12:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12TK9oKn015219 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 16:09:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BF2590A01; Mon, 29 Mar 2021 20:09:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 702FC50455;
	Mon, 29 Mar 2021 20:09:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12TK9jdF004107; 
	Mon, 29 Mar 2021 15:09:46 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12TK9jwc004106;
	Mon, 29 Mar 2021 15:09:45 -0500
Date: Mon, 29 Mar 2021 15:09:45 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210329200945.GL15006@octiron.msp.redhat.com>
References: <1616719966-10221-1-git-send-email-bmarzins@redhat.com>
	<1616719966-10221-3-git-send-email-bmarzins@redhat.com>
	<1088f960e04492a26530385040b2485b3691c94e.camel@suse.com>
	<20210327021853.GI15006@octiron.msp.redhat.com>
	<31162621ac38601976bfa51db92989471fd4c23e.camel@suse.com>
	<20210329182033.GJ15006@octiron.msp.redhat.com>
	<facc763d175793d4d21822f8880522574364680a.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <facc763d175793d4d21822f8880522574364680a.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Hannes Reinecke <hare@suse.com>
Subject: Re: [dm-devel] [PATCH 2/4] libmultipath: fix priorities in
	parse_vpd_pg83
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 07:08:14PM +0000, Martin Wilck wrote:
> On Mon, 2021-03-29 at 13:20 -0500, Benjamin Marzinski wrote:
> > >=20
> > > multipathd could figure out the system configuration from the (non)
> > > availability of certain properties, and use an appropriate fallback
> > > logic for either case.
> >=20
> > That seems like reasonable first step, although one that won't help
> > SID,
> > since it can't rely on getting the wwid from udev.=A0
>=20
> Can you conceive of a different approach that would be better for SID?
> I'd like to hear about it.

I assume that we will continue to have a fallback function to get the
wwid, that will get the proper wwid. As long as you are O.k. with
multipath autodetecting if SID is running, it can just continue to use
the fallback method, so this should be fine.

> >  This actually brings
> > up a different point I have. Is your main objection to adding more
> > config options that it is complicating the code, or confusing the
> > users?
>=20
> Both, with emphasis on the latter. I'm quite positive that we have too
> many options already. That doesn't mean I would generally oppose new
> options if they make sense. We should rather try to get rid of some new
> ones that nobody uses any more.
>=20
> > Because multipath wouldn't need to add any configuration options to
> > be
> > easily usable with SID (the current workaround, setting uid_attribute
> > to
> > "", is pretty non-obvious to users) if it could just check if sid was
> > running, and key off that.=A0 However this adds even more code
> > complexity
> > than simply checking a config option. I don't know how you would feel
> > about accepting a patch that does this, when SID is production ready.
>=20
> I could live well with this autodetection. I think it would be better
> than doing the same thing with a configuration options.
>=20
> Regards,
> Martin
>=20
>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel.=A0+49 (0)911 74053 2107
> SUSE Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

