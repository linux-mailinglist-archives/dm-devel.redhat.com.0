Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EB55034EE9C
	for <lists+dm-devel@lfdr.de>; Tue, 30 Mar 2021 19:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617123604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YnuHI9P+ofEyLjGx77z2cFjI5K9fIIVRVwK77L/lrjQ=;
	b=dqZJcdJZTctOLGptt67oExJe7CCFXga5NP4JyLOfrgQ0wuJgrQihXL1JQRaE1wpIDaHfcM
	aZMJhhzguvWX8lOfdEeUBFnUvE1vQLhEp2X5GS5Wb35cft2QAMPo6ZBj0yD2rOivPq1hlW
	4BuTM7uBdYXjsNQzZ0nWWn4jVhrUAvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-jI7cLjsMPcutPnE6kKNnag-1; Tue, 30 Mar 2021 12:59:58 -0400
X-MC-Unique: jI7cLjsMPcutPnE6kKNnag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81A0D83DD2E;
	Tue, 30 Mar 2021 16:59:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B2151C35;
	Tue, 30 Mar 2021 16:59:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 337E24BB7C;
	Tue, 30 Mar 2021 16:59:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGuCBr012093 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:56:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8B845045A; Tue, 30 Mar 2021 16:56:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DB6618966;
	Tue, 30 Mar 2021 16:56:01 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12UGtxAo010949; 
	Tue, 30 Mar 2021 11:55:59 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12UGtwmA010948;
	Tue, 30 Mar 2021 11:55:58 -0500
Date: Tue, 30 Mar 2021 11:55:58 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20210330165558.GR15006@octiron.msp.redhat.com>
References: <20210326212944.3136-1-mwilck@suse.com>
	<20210326212944.3136-4-mwilck@suse.com>
	<20210330032329.GM15006@octiron.msp.redhat.com>
	<fd0d2c96c9603c8835e83b771e7b2cb96dcec32f.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <fd0d2c96c9603c8835e83b771e7b2cb96dcec32f.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] [PATCH 3/7] github workflows: add containerized /
 multi-arch tests
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 11:00:56AM +0200, Martin Wilck wrote:
> On Mon, 2021-03-29 at 22:23 -0500, Benjamin Marzinski wrote:
> > On Fri, Mar 26, 2021 at 10:29:40PM +0100, mwilck@suse.com=A0wrote:
> > >=20
> > > Tell me if you want this in the multipath-tools repo, and if you're
> > > ok
> > > with hosting the images in my docker hub repo.
> >=20
> > I don't have problems with this setup. I haven't really looked into
> > github actions, and so really don't know how easy it setup rules to run
> > actions on events other that pushes, pull requests, etc. It seems
> > reasonable to store those in a seperate repository. It would probably
> > be
> > good to have Christophe weigh in as well before adding these. Although
> > I
> > suppose it's always possible to disable these actions in other repos.
>=20
> The events and branches are specified in the job file (YAML file). When
> an event occurs on a github repository, github looks at the associated
> commit (SHA), and considers the workflows _included in the tree for
> this commit_. AFAIU, for "push" events, this means that if a branch B
> is pushed with tip commit C, only workflows that exist in C _and_
> reference branch B will be run.
> (see https://docs.github.com/en/actions/reference/events-that-trigger-wor=
kflows)
>=20
> @Christophe, you will need to consider how he would like to set this up
> in your repo. Different repos may have different policies, and it's
> possible that you'll have to tweak or amend when you merge pull
> requests from myself or other people that include changes to github
> actions. For example, you may want to run CI on a different selection
> of branches. I currently have little need for CI runs on pull requests,
> but for you, that may be exactly what you need. Thinking about it, I'll
> add pull-request triggers.


I believe that you can make github check and only run actions on
specific repositories, so Christophe could have different policies,
while still using the same yaml file.

-Ben

>=20
> In general, I will separate github related changes from other code
> changes, as discussed before. The reason I didn't in this patch set was
> that I wanted to advertise my github-action-related work ;-)
>=20
> Cheers,
> Martin
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

