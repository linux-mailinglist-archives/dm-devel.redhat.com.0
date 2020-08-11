Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA402415DF
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 06:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597121937;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GVRDwxa8V9iBNpdZa0h2+nlyHW737RZtcuiWjaIFY/4=;
	b=DZX42wym8nzhW8Fi0X6Sz2J2sqb2k6Ql2ElPX5y7ofCwqJvNqlRsrwwaOZSMrBYEiiEsNh
	jNi4oh8lCMRAcciWMHqp2zNRqsaXY6N/yoQFKO/OlKnVnO0e0IVmgP3z3MsdAFiWaZ5xSI
	+OP8f0JoB6UfeCBOyKgXFXuAhEm7nJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-mEwaqIKmPsOv9g9NFRT7nQ-1; Tue, 11 Aug 2020 00:58:55 -0400
X-MC-Unique: mEwaqIKmPsOv9g9NFRT7nQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C68161005510;
	Tue, 11 Aug 2020 04:58:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EADAE5D9D7;
	Tue, 11 Aug 2020 04:58:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC8014EDB6;
	Tue, 11 Aug 2020 04:58:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07B4ua0d011941 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 00:56:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4FB6410013D7; Tue, 11 Aug 2020 04:56:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 011F510013C4;
	Tue, 11 Aug 2020 04:56:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07B4uVCQ005300; 
	Mon, 10 Aug 2020 23:56:31 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07B4uV3W005299;
	Mon, 10 Aug 2020 23:56:31 -0500
Date: Mon, 10 Aug 2020 23:56:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200811045630.GR19233@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
	<20200709105145.9211-17-mwilck@suse.com>
	<20200719052617.GY11089@octiron.msp.redhat.com>
	<a51ef1b268de27db37386ba05af009f513ecce84.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <a51ef1b268de27db37386ba05af009f513ecce84.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 69/74] libmultipath: disassemble_map(): get
 rid of "is_daemon" argument
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 05, 2020 at 10:05:19PM +0200, Martin Wilck wrote:
> On Sun, 2020-07-19 at 00:26 -0500, Benjamin Marzinski wrote:
> > On Thu, Jul 09, 2020 at 12:51:40PM +0200, mwilck@suse.com wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > > 
> > > The reason for the is_daemon parameter in disassemble_map() lies
> > > deep in multipath-tools' past, in b96dead ("[multipathd] remove the
> > > retry login in uev_remove_path()"): By not adding paths from
> > > disassembled maps to the pathvec, we avoided to re-add removed
> > > paths on
> > > future map reloads (logic in update_mpp_paths()). As we can handle
> > > this with
> > > INIT_REMOVED now, we don't need to distinguish daemon and non-
> > > daemon
> > > mode any more. This fixes a memory leak, because only paths which
> > > are in
> > > pathvec will be freed on program exit.
> > 
> > I don't have any problems with the code in this patch. I just want to
> > reiterate that I don't think that multipathd should automatically be
> > adding paths, just because they were in a multipath device.  In my
> > opinion, multipathd should have the final decision as to what a
> > multipath device should look like.  If it sees an unexpected path,
> > and
> > runs pathinfo on it, and finds that that path does belong, it's fine
> > to
> > add it. But if pathinfo says that the path doesn't belong, multipathd
> > shouldn't add it to the pathvec. It should instead trigger a reload
> > of
> > the device to remove path.
> 
> Got it. I commented in my reply to 65/74. I'll repost this part with
> the minor issues you raised fixed (hopefully). Then let's review /
> discuss this again. If we agree on your PoV, we can probably ditch the
> whole INIT_REMOVED part of my series.

Sure.

> I hope you agree that "if (!is_daemon)" so deep in libmultipath
> is ugly and should be replaced by something cleaner.

That really never bothered me, but I see your point.
 
> We should take the opportunity to agree on a definition on the exact
> semantics of pathvec, i.e. which devices should be members of pathvec,
> and which ones shouldn't. I don't see a clear, consequent definition
> currently.

I think that you're correct that all paths that multipathd is dealing
with should be on the pathvec. Obviously paths that are only accessable
via a local variable are fine, but code shouldn't be dropping the vecs
lock with a path that is accessable globally (for instance from
mpp->paths) but not on the pathvec. What disassemble_map() has been
doing is definitely wrong.

-Ben

> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

