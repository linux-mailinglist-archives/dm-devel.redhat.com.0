Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BDDDA264E37
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 21:06:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599764782;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0GprH3GOYxeeZHUXwAjKFEApYQINd6JSLy8xyFA1gDw=;
	b=D5BWi0hWUGtWRYWAcO7mdPvpiTuNoX9b5qMqQLqViNsbnLtuA2j3Vkf2Ag6NrzmVpA19L8
	aRQZ8guWM8yqCRRrqOrl9oNkWQBtQrnNVUibGmsrhdXCp/L/jImkhrYAK/R26AyAqSP2Th
	XZBiLJBaHb6CDb14CXXOhAD6HDOqM3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-Q8BuEqhyMRadvVbqSJhQrQ-1; Thu, 10 Sep 2020 15:06:20 -0400
X-MC-Unique: Q8BuEqhyMRadvVbqSJhQrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A021918BA28E;
	Thu, 10 Sep 2020 19:06:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74FAB60BF4;
	Thu, 10 Sep 2020 19:06:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 656A1183D021;
	Thu, 10 Sep 2020 19:06:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AJ2vtc020132 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 15:02:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 969EE7E73E; Thu, 10 Sep 2020 19:02:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9FEF7E731;
	Thu, 10 Sep 2020 19:02:52 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08AJ2p75001865; 
	Thu, 10 Sep 2020 14:02:51 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08AJ2oiw001864;
	Thu, 10 Sep 2020 14:02:50 -0500
Date: Thu, 10 Sep 2020 14:02:50 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200910190250.GP11108@octiron.msp.redhat.com>
References: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
	<22e82157-f180-b95b-c72c-b7b13acf1c8a@huawei.com>
	<07b61c335cbdbd7c029474c92a5d6f156ef523e0.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <07b61c335cbdbd7c029474c92a5d6f156ef523e0.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V4 09/14] libmultipath: check whether
 mpp->features is NUll in setup_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 10, 2020 at 06:48:56PM +0200, Martin Wilck wrote:
> On Thu, 2020-09-10 at 18:51 +0800, lixiaokeng wrote:
> > In assemble_map func, f = STRDUP(mp->features) is just used
> > for APPEND(). We can directly pass mp->features to APPEND().
> > The mpp->features, hwhandler and selector got form strdup
> > should be check after select* function.
> > 
> > Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> > Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> 
> Thanks for submitting the new version. Looking at your patch, I realize
> that my previous suggestion wasn't perfect. 
> 
> > ---
> >  libmultipath/configure.c |  5 +++++
> >  libmultipath/dmparser.c  | 11 ++++-------
> >  2 files changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> > index 5bc65fd3..5d5d9415 100644
> > --- a/libmultipath/configure.c
> > +++ b/libmultipath/configure.c
> > @@ -355,6 +355,11 @@ int setup_map(struct multipath *mpp, char
> > *params, int params_size,
> >  	select_ghost_delay(conf, mpp);
> >  	select_flush_on_last_del(conf, mpp);
> > 
> > +	if (!mpp->features || !mpp->hwhandler || !mpp->selector) {
> > +		condlog(0, "%s: map select failed", mpp->alias);
> > +		return 1;
> > +	}
> > +
> 
> We have a new failure mode for setup_map() here. While this is a good
> thing in principle, there are issues. 
> 
>  1) by returning, we skip the rest of the initialization steps for the
> map. Thus paths and pathgroups may be set up wrongly after setup_map().
>  2) Not every caller deletes the map from the mpvec after setup_map()
> fails. For some callers like resize_map() or reload_map(), that's
> actually not possible.
> 
> 1) is a minor problem because no caller calls domap() after setup_map()
> failure, afaics. But 2) is a problem, because the broken, partially
> initialized struct multipath will remain in our data structures, and my
> assumption that features etc. are always valid will be violated.
> 2) is not a regression of this patch though, it has always been the
> case.
> 
> I'm not yet decided how to deal with this. Perhaps setup_map()
> shouldn't free features, hwhandler, and selector until the new values
> have been successfully obtained.
> 
> (Actually, what's the point in running through *all* select_xyz()
> functions just for a map resize?)
> 
> Ben?

I don't know of any reason why that's necessary, or why it was
originally done that way.  If we've already configured the device, and
we're not doing a reconfigure, there's not a lot to be gained by doing
configuring again. Some to the select_* functions grab stuff from sysfs,
and so could return different values, but I'm sure there is a lot of
work that could be cut out here, with no noticeable changes in behavior.

Ideally we should stick to a "do no harm" policy when updating the
device.  It seems better to have a device structure that's outdated than
one that's invalid.

But regardless of what we do in setup_map, the assemble_map() part of
this patch is correct, and as you said, the setup_map() changes don't
introduce any new problems. It seems like resolving the issue in
setup_map() should be seperate work.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.coM>
 
> Regards
> Martin
> 
> 
> 
> 
> 
> 
> >  	sysfs_set_scsi_tmo(mpp, conf->checkint);
> >  	marginal_pathgroups = conf->marginal_pathgroups;
> >  	pthread_cleanup_pop(1);
> > diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> > index 482e9d0e..685918da 100644
> > --- a/libmultipath/dmparser.c
> > +++ b/libmultipath/dmparser.c
> > @@ -65,7 +65,7 @@ assemble_map (struct multipath * mp, char * params,
> > int len)
> >  	int i, j;
> >  	int minio;
> >  	int nr_priority_groups, initial_pg_nr;
> > -	char * p, * f;
> > +	char * p;
> >  	const char *const end = params + len;
> >  	char no_path_retry[] = "queue_if_no_path";
> >  	char retain_hwhandler[] = "retain_attached_hw_handler";
> > @@ -86,10 +86,9 @@ assemble_map (struct multipath * mp, char *
> > params, int len)
> >  	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0))
> >  		add_feature(&mp->features, retain_hwhandler);
> > 
> > -	f = STRDUP(mp->features);
> > -
> > -	APPEND(p, end, "%s %s %i %i", f, mp->hwhandler,
> > nr_priority_groups,
> > -	       initial_pg_nr);
> > +	/* mp->features must not be NULL */
> > +	APPEND(p, end, "%s %s %i %i", mp->features, mp->hwhandler,
> > +		nr_priority_groups, initial_pg_nr);
> > 
> >  	vector_foreach_slot (mp->pg, pgp, i) {
> >  		pgp = VECTOR_SLOT(mp->pg, i);
> > @@ -110,12 +109,10 @@ assemble_map (struct multipath * mp, char *
> > params, int len)
> >  		}
> >  	}
> > 
> > -	FREE(f);
> >  	condlog(4, "%s: assembled map [%s]", mp->alias, params);
> >  	return 0;
> > 
> >  err:
> > -	FREE(f);
> >  	return 1;
> >  }
> > 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

