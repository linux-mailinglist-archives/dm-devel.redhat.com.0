Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CE6102DE768
	for <lists+dm-devel@lfdr.de>; Fri, 18 Dec 2020 17:25:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-sifcj4IhN1idYPb5iN1-fg-1; Fri, 18 Dec 2020 11:25:04 -0500
X-MC-Unique: sifcj4IhN1idYPb5iN1-fg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CAE99CC0E;
	Fri, 18 Dec 2020 16:24:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88BBD60C47;
	Fri, 18 Dec 2020 16:24:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4620D180954D;
	Fri, 18 Dec 2020 16:24:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIGOX8j021596 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 11:24:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 90265F3D39; Fri, 18 Dec 2020 16:24:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A8CDF3D3A
	for <dm-devel@redhat.com>; Fri, 18 Dec 2020 16:24:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B728185A7BC
	for <dm-devel@redhat.com>; Fri, 18 Dec 2020 16:24:30 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-584-l0DstVhUOxWNeb_MelzTmQ-1;
	Fri, 18 Dec 2020 11:24:27 -0500
X-MC-Unique: l0DstVhUOxWNeb_MelzTmQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 74D0DAD6A;
	Fri, 18 Dec 2020 16:24:26 +0000 (UTC)
Message-ID: <4e17c5f7ae1c911dc280458cda3ccb5578c0de9e.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 18 Dec 2020 17:24:25 +0100
In-Reply-To: <20201218000311.GD3103@octiron.msp.redhat.com>
References: <20201217110018.3347-1-mwilck@suse.com>
	<20201217110018.3347-3-mwilck@suse.com>
	<20201218000311.GD3103@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/7] libmultipath: protect logarea with
	logq_lock
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-17 at 18:03 -0600, Benjamin Marzinski wrote:
> On Thu, Dec 17, 2020 at 12:00:13PM +0100, mwilck@suse.com wrote:
> >  
> > -void free_logarea (void)
> > +static void free_logarea (void)
> >  {
> >  	FREE(la->start);
> >  	FREE(la->buff);
> 
> I realize that the log area can only be freed by log_close(), which
> is
> called when mulitpathd exits, but it would be nice to have la set to
> NULL it's freed, just to make it obvious that that there can't be
> double-frees there. 

There's FREE(la) right after this, and FREE(x) sets the pointer to
NULL. So it should be fine, or am I confused?

> However, the code is clearly correct, so
> 
> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

