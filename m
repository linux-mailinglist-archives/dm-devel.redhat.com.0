Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7FA2DCEF4
	for <lists+dm-devel@lfdr.de>; Thu, 17 Dec 2020 10:59:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-yVEBUI1iOSuZGsskQ2Chow-1; Thu, 17 Dec 2020 04:58:58 -0500
X-MC-Unique: yVEBUI1iOSuZGsskQ2Chow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FD7F10054FF;
	Thu, 17 Dec 2020 09:58:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70F4E5D9C0;
	Thu, 17 Dec 2020 09:58:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D15E4BB7B;
	Thu, 17 Dec 2020 09:58:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BH9sHio023393 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Dec 2020 04:54:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF99E2026D13; Thu, 17 Dec 2020 09:54:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5942026D48
	for <dm-devel@redhat.com>; Thu, 17 Dec 2020 09:54:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92CDE186E121
	for <dm-devel@redhat.com>; Thu, 17 Dec 2020 09:54:12 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-463-0AJUnaRIP_iH2uv78AwuSw-1;
	Thu, 17 Dec 2020 04:54:07 -0500
X-MC-Unique: 0AJUnaRIP_iH2uv78AwuSw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2FB34AC90;
	Thu, 17 Dec 2020 09:54:06 +0000 (UTC)
Message-ID: <cf163264941c5b56e5bb28b3e0878e7aa7dd8989.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 17 Dec 2020 10:54:05 +0100
In-Reply-To: <20201217033427.GV3103@octiron.msp.redhat.com>
References: <20201216181708.22224-1-mwilck@suse.com>
	<20201216181708.22224-23-mwilck@suse.com>
	<20201217033427.GV3103@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 22/29] multipath: fix leaks in
	check_path_valid()
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

On Wed, 2020-12-16 at 21:34 -0600, Benjamin Marzinski wrote:
> On Wed, Dec 16, 2020 at 07:17:01PM +0100, mwilck@suse.com wrote:
> > 
> >  
> >  	pp = alloc_path();
> >  	if (!pp)
> > @@ -665,13 +666,17 @@ check_path_valid(const char *name, struct
> > config *conf, bool is_uevent)
> >  	if (store_path(pathvec, pp) != 0) {
> 
> This will double-free the path, once here and again in cleanup.

argh, thanks - especially dumb with comment below :-/

> >  		free_path(pp);
> >  		goto fail;
> > +	} else {
> > +		/* make sure path isn't freed twice */
> > +		wwid = pp->wwid;
> > +		pp = NULL;
> >  	}
> > 
> ...
> > +
> > +cleanup:
> > +	if (pp != NULL)
> 
> shouldn't this be free_path(pp)

Absolutely. I'll resend this one. As everything else is reviewed now,
I'll just resubmit this one.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

