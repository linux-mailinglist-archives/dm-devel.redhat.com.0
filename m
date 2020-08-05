Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B752B23D048
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 21:47:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-fLHPxkB3M2CY550RWvhGdg-1; Wed, 05 Aug 2020 15:47:29 -0400
X-MC-Unique: fLHPxkB3M2CY550RWvhGdg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A93B58;
	Wed,  5 Aug 2020 19:47:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAC205DA6B;
	Wed,  5 Aug 2020 19:47:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DCC31809554;
	Wed,  5 Aug 2020 19:47:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075JioWk008165 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 15:44:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 370252023283; Wed,  5 Aug 2020 19:44:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 312EC20182AB
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 19:44:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E53078007D1
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 19:44:46 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-271-xoQuo94BMPuQgenZpi2gaw-1;
	Wed, 05 Aug 2020 15:44:42 -0400
X-MC-Unique: xoQuo94BMPuQgenZpi2gaw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 481FEAB76;
	Wed,  5 Aug 2020 19:44:58 +0000 (UTC)
Message-ID: <b74c9d674b40d6efe889fadfd005758e79dc4d8d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 05 Aug 2020 21:44:40 +0200
In-Reply-To: <20200719051200.GX11089@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
	<20200709105145.9211-14-mwilck@suse.com>
	<20200719051200.GX11089@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 66/74] libmultipath: update_pathvec_from_dm:
 handle pp->mpp mismatch
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

On Sun, 2020-07-19 at 00:12 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 09, 2020 at 12:51:37PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > Treat this like a WWID mismatch.
> > 
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  libmultipath/structs_vec.c | 37 +++++++++++++++++++++++-----------
> > ---
> >  1 file changed, 23 insertions(+), 14 deletions(-)
> > 
> > diff --git a/libmultipath/structs_vec.c
> > b/libmultipath/structs_vec.c
> > index 5dd37d5..8651b98 100644
> > --- a/libmultipath/structs_vec.c
> > +++ b/libmultipath/structs_vec.c
> > 
> > [...]
> > +		bad_path:
> > +			/*
> > +			 * This path exists, but in the wrong map.
> > +			 * We can't reload the map from here.
> > +			 * Instead, treat this path like "missing
> > udev".
> > +			 * check_path() will trigger an uevent and
> > reset pp->tick.
> > +			 */
> > +			must_reload = true;
> > +			pp->mpp = NULL;
> > +			dm_fail_path(mpp->alias, pp->dev_t);
> > +			vector_del_slot(pgp->paths, j--);
> > +			pp->initialized = INIT_MISSING_UDEV;
> > +			pp->tick = 1;
> 
> Is there a reason not to call orphan_path() to clean up things like
> any
> open fd, until we figure out what to do with the path.

Thanks for the suggestion. It makes sense for the 2nd "bad_path"
condition but not for the first. I'll treat the two cases differently.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

