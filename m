Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5682029CA1A
	for <lists+dm-devel@lfdr.de>; Tue, 27 Oct 2020 21:25:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-5CizQTGSMrmBJfiXhxXEfQ-1; Tue, 27 Oct 2020 16:25:41 -0400
X-MC-Unique: 5CizQTGSMrmBJfiXhxXEfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFEC459;
	Tue, 27 Oct 2020 20:25:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E99411002C0B;
	Tue, 27 Oct 2020 20:25:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0ADECCF52;
	Tue, 27 Oct 2020 20:25:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09RK4p1m016773 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Oct 2020 16:04:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A1F3A110DBFD; Tue, 27 Oct 2020 20:04:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E2731000DAB
	for <dm-devel@redhat.com>; Tue, 27 Oct 2020 20:04:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D243811E76
	for <dm-devel@redhat.com>; Tue, 27 Oct 2020 20:04:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-41-7098ERHSPDm2AAWa6RdUbg-1; 
	Tue, 27 Oct 2020 16:04:44 -0400
X-MC-Unique: 7098ERHSPDm2AAWa6RdUbg-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 965AF2222C;
	Tue, 27 Oct 2020 20:04:42 +0000 (UTC)
Date: Tue, 27 Oct 2020 13:04:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20201027200441.GA2416412@gmail.com>
References: <20201015214632.41951-1-satyat@google.com>
	<20201015214632.41951-2-satyat@google.com>
MIME-Version: 1.0
In-Reply-To: <20201015214632.41951-2-satyat@google.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 1/4] block: keyslot-manager: Introduce
 passthrough keyslot manager
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 15, 2020 at 09:46:29PM +0000, Satya Tangirala wrote:
> +/**
> + * blk_ksm_init_passthrough() - Init a passthrough keyslot manager
> + * @ksm: The keyslot manager to init
> + *
> + * Initialize a passthrough keyslot manager.
> + * Called by e.g. storage drivers to set up a keyslot manager in their
> + * request_queue, when the storage driver wants to manage its keys by itself.
> + * This is useful for inline encryption hardware that doesn't have the concept
> + * of keyslots, and for layered devices.
> + *
> + * See blk_ksm_init() for more details about the parameters.
> + */
> +void blk_ksm_init_passthrough(struct blk_keyslot_manager *ksm)
> +{
> +	memset(ksm, 0, sizeof(*ksm));
> +	init_rwsem(&ksm->lock);
> +}
> +EXPORT_SYMBOL_GPL(blk_ksm_init_passthrough);

The last paragraph of the comment ("See blk_ksm_init() for more details about
the parameters.") isn't useful and should be removed.

Otherwise this patch looks fine.  You can add:

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

