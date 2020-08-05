Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3D12D23CB0E
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 15:40:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-jsN6jg__M5KKPbXaPWGC0Q-1; Wed, 05 Aug 2020 09:40:11 -0400
X-MC-Unique: jsN6jg__M5KKPbXaPWGC0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F23B657;
	Wed,  5 Aug 2020 13:40:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8965D2B6D9;
	Wed,  5 Aug 2020 13:39:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 097991809557;
	Wed,  5 Aug 2020 13:39:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075Ddb2V023869 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 09:39:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 198C320316D9; Wed,  5 Aug 2020 13:39:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15B8020316D8
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 13:39:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC02B805F40
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 13:39:34 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-301-NuGGixU7P3agSWD2Xku8Og-1;
	Wed, 05 Aug 2020 09:39:32 -0400
X-MC-Unique: NuGGixU7P3agSWD2Xku8Og-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BDAA4AC85;
	Wed,  5 Aug 2020 13:39:47 +0000 (UTC)
Message-ID: <96142934e52fa9af642b3912a8b5851e76e53d7a.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 05 Aug 2020 15:39:30 +0200
In-Reply-To: <20200717222108.GS11089@octiron.msp.redhat.com>
References: <20200709103623.8302-1-mwilck@suse.com>
	<20200709103623.8302-5-mwilck@suse.com>
	<20200717222108.GS11089@octiron.msp.redhat.com>
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
Subject: Re: [dm-devel] [PATCH 46/54] libmultipath: path_discover(): always
 set DI_BLACKLIST
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-17 at 17:21 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 09, 2020 at 12:36:15PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > Since 65e1845 ("multipath: call store_pathinfo with DI_BLACKLIST"),
> > we
> > use DI_BLACKLIST for new paths. There's no reason why we shouldn't
> > do the
> > same with paths which are (unexpectedly) already in pathvec. As
> > argued
> > for 65e1845, this might save some unnecessary work for paths which
> > are
> > blacklisted anyway.
> 
> It seems to me like either we should assume that if we added the path
> to
> pathvec, it's valid, or we should check, and if it's blacklisted,
> remove
> it. Just leaving it on pathvec without all of the pathinfo work done
> doesn't make much sense to me. Am I missing something here?

TL;DR: let's skip this patch for now.

path_discover() is only called from path_discovery(). path_discovery()
is called from 

 1 configure() (multipathd), with an empty pathvec
 2 configure() (multipath), with a pathvec possibly pre-populated by
get_refwwid()
 3 check_valid_path(), with pathvec pre-populated with the path to be
checked

For 1) my patch obviously makes no difference. In case 2) get_refwwid()
sets DI_BLACKLIST anyway (except for CMD_REMOVE_WWID, in which case
path_discovery() is not called). In case 3), DI_BLACKLIST
has already been used by is_path_valid() (the only exception being the
"is already multipathed" case, in which path_discovery() is not
called).

So, this patch makes no difference in practice - all callers make sure
that the pathvec is pre-populated only with non-blacklisted paths.

The reason I wrote this patch was because I wanted to use consistent
flags in path_discover() - it was non-obvious to me why we treated
existing and new paths differently. The side effect was a very small
speed-up. 

But your argument above is valid. 

To me it would come as a surprise if path_discovery() removed paths;
that's the kind of side effect I'd like to minimize in our code. Thus,
path_discover() should rely on the caller wrt the pre-populated paths,
and not use DI_BLACKLIST on them.

For now, I'll replace this patch with a comment explaining why we use
different flags in the two pathinfo() calls. 

In the future, we may want to change path_discovery() such that it only
works on an empty pathvec. IMO that would be cleaner, and require only
minimal changes to callers.

Thanks,
Martin


> -Ben
>  
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  libmultipath/discovery.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> > index 5f4ebf0..caabfef 100644
> > --- a/libmultipath/discovery.c
> > +++ b/libmultipath/discovery.c
> > @@ -137,7 +137,7 @@ path_discover (vector pathvec, struct config *
> > conf,
> >  				      udevice, flag | DI_BLACKLIST,
> >  				      NULL);
> >  	else
> > -		return pathinfo(pp, conf, flag);
> > +		return pathinfo(pp, conf, flag | DI_BLACKLIST);
> >  }
> >  
> >  static void cleanup_udev_enumerate_ptr(void *arg)
> > -- 
> > 2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

