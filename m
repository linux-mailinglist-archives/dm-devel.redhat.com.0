Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E1490279965
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 15:01:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-xqGU1zJgOE6vllz6ors5Yw-1; Sat, 26 Sep 2020 09:01:51 -0400
X-MC-Unique: xqGU1zJgOE6vllz6ors5Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA8D21868412;
	Sat, 26 Sep 2020 13:01:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 957FE19C66;
	Sat, 26 Sep 2020 13:01:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C9DA18408A0;
	Sat, 26 Sep 2020 13:01:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08QD19UA028408 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 26 Sep 2020 09:01:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 013A710064FE; Sat, 26 Sep 2020 13:01:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFDFB1006185
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 13:01:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 362CC8582AB
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 13:01:06 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-284-fj48ppaxPSqGRsTU1y1zdQ-1;
	Sat, 26 Sep 2020 09:01:01 -0400
X-MC-Unique: fj48ppaxPSqGRsTU1y1zdQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 413C8B28D;
	Sat, 26 Sep 2020 13:01:00 +0000 (UTC)
Message-ID: <20711328a510d2c02aba22b584a7f5eb1e4ecf65.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 26 Sep 2020 15:00:58 +0200
In-Reply-To: <20200926015207.GJ3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-2-mwilck@suse.com>
	<20200926015207.GJ3384@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 01/23] multipathd: uxlsnr: avoid deadlock on
	exit
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

On Fri, 2020-09-25 at 20:52 -0500, Benjamin Marzinski wrote:
> 
> O.k. I'm getting way into the theoretical weeds here, but I believe
> that
> realloc() is technically allowed to return NULL when it shrinks
> allocated memory. In this case num_clients would be too big.  Later
> in
> this function, when we loop through num_clients
> 
>                 for (i = 2; i < num_clients + 2; i++) {
>                         if (polls[i].revents & POLLIN) {
>  
> We could look at an unused polls entry, since its revents doesn't get
> cleared. It's also possible that the fd of this unused entry matches
> the
> fd of an existing client. Then we could try to get a packet from a
> client that isn't sending one, and kill that client. Yeah, this will
> almost certainly never happen.  But we could just zero out the
> revents
> field, or loop over the actual number of structures we polled, and
> then
> it can't happen.

I'll fix this up in this patch, and add another patch to sanitize this.
calling realloc() when the number of fds shrinks really isn't buying us
much.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

