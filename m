Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E049923D34E
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 22:55:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-HM8RktwpOoKW6CdNmvZ8Qg-1; Wed, 05 Aug 2020 16:54:59 -0400
X-MC-Unique: HM8RktwpOoKW6CdNmvZ8Qg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAE0B101C8A0;
	Wed,  5 Aug 2020 20:54:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7CDF5DA60;
	Wed,  5 Aug 2020 20:54:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B663F1809554;
	Wed,  5 Aug 2020 20:54:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075KsPqr016281 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 16:54:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83F4A1004173; Wed,  5 Aug 2020 20:54:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EDBF1004157
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 20:54:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 877828007D8
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 20:54:19 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-359-0aGG4CiCNPG1_8XBDgK07A-1;
	Wed, 05 Aug 2020 16:54:17 -0400
X-MC-Unique: 0aGG4CiCNPG1_8XBDgK07A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0100CAEB2;
	Wed,  5 Aug 2020 20:54:32 +0000 (UTC)
Message-ID: <6b9ca2954255216cb78b76bd63b1086fdaeefd7e.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 05 Aug 2020 22:54:15 +0200
In-Reply-To: <20200720034455.GA11089@octiron.msp.redhat.com>
References: <20200709110330.9917-1-mwilck@suse.com>
	<20200709110330.9917-3-mwilck@suse.com>
	<20200720034455.GA11089@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 76/80] libmultipath: select_action(): force
 udev reload for uninitialized maps
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

On Sun, 2020-07-19 at 22:44 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 09, 2020 at 01:03:26PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > If we are in the reconfigure() code path, and we encounter maps to
> > be reloaded, we usually set the DM_SUBSYSTEM_UDEV_FLAG0 flag to
> > tell
> > udev not to repeat device detection steps above the multipath
> > layer.
> > However, if the map was previously uninitialized, we have to force
> > udev to reload.
> > 
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  libmultipath/configure.c | 61 ++++++++++++++++++++++++----------
> > ------
> >  1 file changed, 37 insertions(+), 24 deletions(-)
> > 
> > diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> > index 2509053..efb5808 100644
> > --- a/libmultipath/configure.c
> > +++ b/libmultipath/configure.c
> > @@ -660,6 +660,32 @@ sysfs_set_max_sectors_kb(struct multipath
> > *mpp, int is_reload)
> >  	return err;
> >  }
> >  
> > +static void
> > +select_reload_action(struct multipath *mpp, const char *reason)
> > +{
> > +	struct udev_device *mpp_ud;
> > +	const char *env;
> > +
> > +	/*
> > +	 * MPATH_DEVICE_READY != 1 can mean two things:
> > +	 *  (a) no usable paths
> > +	 *  (b) device was never fully processed (e.g. udev killed)
> > +	 * If we are in this code path (startup or forced reconfigure),
> > +	 * (b) can mean that upper layers like kpartx have never been
> > +	 * run for this map. Thus force udev reload.
> > +	 */
> > +
> 
> This looks like it wants multipath to check if there are valid
> devices
> before setting force reload.  But looking at the udev rules, I'm
> pretty
> sure it's safe. If we have no valid paths, then we will have
> 
> ENV{DM_NOSCAN}="1 and ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
> 
> which means it doesn't matter that force_udev_reload will cause
> 
> ENV{DM_ACTIVATION}="1" and ENV{MPATH_UNCHANGED}=""
> 
> It does get sort of confusing with the number of udev properties that
> can
> effect things.  So nothing really needs to get done for this to be
> correct, but perhaps this code should only set force reload is there
> are
> valid paths, just to be clear.

Will do. Full ack wrt the confusing udev rules (patches welcome :D)

Note btw that multipathd triggers a synthetic change event in
reconfigure if no changes were applied; but that code is hardly ever
executed because we normally set queue_if_no_path, and during startup
multipathd will never encounter a queueing map.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

