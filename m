Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E59FE298EB3
	for <lists+dm-devel@lfdr.de>; Mon, 26 Oct 2020 14:59:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-O8H9a4tVNoCrvzcNSQJsLA-1; Mon, 26 Oct 2020 09:59:22 -0400
X-MC-Unique: O8H9a4tVNoCrvzcNSQJsLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B39F91009E46;
	Mon, 26 Oct 2020 13:59:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ADFB5D9E4;
	Mon, 26 Oct 2020 13:59:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6123181A06B;
	Mon, 26 Oct 2020 13:59:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09QDx6l5004110 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 09:59:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D235200BA9E; Mon, 26 Oct 2020 13:59:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9752D201154A
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 13:59:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B6F88007DF
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 13:59:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-33--D6CwifWOtiWOQ14iB-WyQ-1;
	Mon, 26 Oct 2020 09:59:02 -0400
X-MC-Unique: -D6CwifWOtiWOQ14iB-WyQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 640A7AE7D;
	Mon, 26 Oct 2020 13:59:00 +0000 (UTC)
Message-ID: <fd98492103cd1ed95941b90f75c440c921f6694a.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 26 Oct 2020 14:58:59 +0100
In-Reply-To: <20201019200012.GE3384@octiron.msp.redhat.com>
References: <20201016104501.8700-1-mwilck@suse.com>
	<20201016104501.8700-19-mwilck@suse.com>
	<20201019200012.GE3384@octiron.msp.redhat.com>
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
Subject: Re: [dm-devel] [PATCH v2 18/29] libmultipath: fix log_thread
 startup and teardown
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

On Mon, 2020-10-19 at 15:00 -0500, Benjamin Marzinski wrote:
>  
> >  void log_thread_start (pthread_attr_t *attr)
> >  {
> > -	logdbg(stderr,"enter log_thread_start\n");
> > +	bool err = false;
> >  
> > -	pthread_mutex_init(&logq_lock, NULL);
> > -	pthread_mutex_init(&logev_lock, NULL);
> > -	pthread_cond_init(&logev_cond, NULL);
> 
> If you remove these initializers, then these variables are
> uninitialized. I realize that patch 29 makes them statically
> initialized, so I'm not sure how big of an issue it is.  I guess it
> depends on how much we care about the possiblity of things not
> working
> right when bisecting an issue.
> 

Thanks for pointing this out. It was a rebasing mistake. I'll fix it.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

