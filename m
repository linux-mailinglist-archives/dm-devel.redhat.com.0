Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4E99B278D92
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 18:04:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-rOwPCM25NtGZ_JX3CiKz4Q-1; Fri, 25 Sep 2020 12:04:42 -0400
X-MC-Unique: rOwPCM25NtGZ_JX3CiKz4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20C3A188C129;
	Fri, 25 Sep 2020 16:04:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4225DA33;
	Fri, 25 Sep 2020 16:04:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5523B1826D2D;
	Fri, 25 Sep 2020 16:04:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PG1Zot026161 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 12:01:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8341410ABCA6; Fri, 25 Sep 2020 16:01:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EFC710ABCA5
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 16:01:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 249BA803522
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 16:01:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-429-LHATz-wROB-x5ksQRHm-RQ-1;
	Fri, 25 Sep 2020 12:01:29 -0400
X-MC-Unique: LHATz-wROB-x5ksQRHm-RQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 571BDACB8;
	Fri, 25 Sep 2020 16:01:27 +0000 (UTC)
Message-ID: <f3b7a133b11ef4088948c76706ea088d40817039.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 25 Sep 2020 18:01:26 +0200
In-Reply-To: <20200924201245.GH11108@octiron.msp.redhat.com>
References: <20200924133644.14034-1-mwilck@suse.com>
	<20200924133644.14034-3-mwilck@suse.com>
	<20200924201245.GH11108@octiron.msp.redhat.com>
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
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 02/11] libmultipath: copy mpp->hwe from
	pp->hwe
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

On Thu, 2020-09-24 at 15:12 -0500, Benjamin Marzinski wrote:
> On Thu, Sep 24, 2020 at 03:36:35PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > Since f0462f0 ("libmultipath: use vector for for pp->hwe and mp-
> > >hwe"),
> > we've been trying to fix issues caused by paths getting freed and
> > mpp->hwe
> > dangling. This approach couldn't work because we need mpp->hwe to
> > persist,
> > even if all paths are removed from the map. Before f0462f0, a
> > simple
> > assignment worked, because the lifetime of the hwe wasn't bound to
> > the
> > path. But now, we need to copy the vector. It turns out that we
> > need to set
> > mpp->hwe only in two places, add_map_with_path() and setup_map(),
> > and
> > that the code is simplified overall.
> 
> Unless I'm missing someting, it looks like
> __mpath_persistent_reserve_out() will call select_all_tg_pt(), which
> uses mpp->hwe, without ever setting it.  Granted, I don't see how
> this
> was supposed to work before your patch either.

Right, it doesn't. Thanks for spotting it.
Ok to create a new, separate patch for it?

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

