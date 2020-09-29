Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4997B27C09D
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 11:13:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-9xklZGHCPNGNbmMutNz6Vw-1; Tue, 29 Sep 2020 05:13:03 -0400
X-MC-Unique: 9xklZGHCPNGNbmMutNz6Vw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4258102120B;
	Tue, 29 Sep 2020 09:12:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D4765C1CF;
	Tue, 29 Sep 2020 09:12:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C10AB181A050;
	Tue, 29 Sep 2020 09:12:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08T9CqNp013245 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Sep 2020 05:12:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93DDDA9F5D; Tue, 29 Sep 2020 09:12:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DD87AB59C
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 09:12:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E3C4801184
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 09:12:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-567-2NqZburqNaCFoAbsON337A-1;
	Tue, 29 Sep 2020 05:12:46 -0400
X-MC-Unique: 2NqZburqNaCFoAbsON337A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 873F0AD80
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 09:12:45 +0000 (UTC)
Message-ID: <28ff7b2c246907821bf20ce764552f7b140d6b8b.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: dm-devel@redhat.com
Date: Tue, 29 Sep 2020 11:12:44 +0200
In-Reply-To: <20200928180312.GM3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-8-mwilck@suse.com>
	<20200928180312.GM3384@octiron.msp.redhat.com>
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
Subject: Re: [dm-devel] [PATCH 07/23] multipathd: move conf destruction into
 separate function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-28 at 13:03 -0500, Benjamin Marzinski wrote:
>  
> > -	if (logsink == 1)
> > +	if (logsink == 1) {
> > +		logsink = 0;
> >  		log_thread_stop();
> 
> It seems like log_thread_stop() could just do something like
> 
> pthread_t log_thr_save = log_thr;
> log_thr = (pthread_t)0;
> 
> at the start, and then you would continue to get syslog logging, even
> when the log thread stopped. It's racy, but all the other threads
> (except the log_thread, obviously) should be stopped. Or am I not
> understanding the purpose of doing this?

I guess we could do this, yes (although I think (pthread_t)0 should be
avoided, but that's a different issue. Let me have another look.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

