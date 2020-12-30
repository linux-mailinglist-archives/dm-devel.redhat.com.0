Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 677D02E7BB2
	for <lists+dm-devel@lfdr.de>; Wed, 30 Dec 2020 18:54:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-iSWqUyPqOVGF_rR8KL7YCg-1; Wed, 30 Dec 2020 12:54:38 -0500
X-MC-Unique: iSWqUyPqOVGF_rR8KL7YCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BA7759;
	Wed, 30 Dec 2020 17:54:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C59DE62499;
	Wed, 30 Dec 2020 17:54:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1901B180954D;
	Wed, 30 Dec 2020 17:54:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BUHrvrJ023741 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 30 Dec 2020 12:53:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A1CAA7AE8; Wed, 30 Dec 2020 17:53:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7D85D232
	for <dm-devel@redhat.com>; Wed, 30 Dec 2020 17:53:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47F22805BC3
	for <dm-devel@redhat.com>; Wed, 30 Dec 2020 17:53:51 +0000 (UTC)
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-130-m9f--IqVPO-K96xDpkUGhA-1; Wed, 30 Dec 2020 12:53:46 -0500
X-MC-Unique: m9f--IqVPO-K96xDpkUGhA-1
Received: from host86-158-105-41.range86-158.btcentralplus.com
	([86.158.105.41] helo=[192.168.1.65])
	by smtp.hosts.co.uk with esmtpa (Exim)
	(envelope-from <antlists@youngman.org.uk>)
	id 1kuffN-0002l6-Al; Wed, 30 Dec 2020 17:53:45 +0000
To: John Stoffel <john@stoffel.org>, Danny Shih <dannyshih@synology.com>
References: <1609233522-25837-1-git-send-email-dannyshih@synology.com>
	<1609233522-25837-2-git-send-email-dannyshih@synology.com>
	<24555.49943.411197.147225@quad.stoffel.home>
	<abac671f-91f2-ca4e-7f77-8bb5da85a4cc@synology.com>
	<24556.45969.276771.345181@quad.stoffel.home>
From: antlists <antlists@youngman.org.uk>
Message-ID: <1b6c4709-8409-a73f-d3f0-4b4cf19bfae1@youngman.org.uk>
Date: Wed, 30 Dec 2020 17:53:44 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <24556.45969.276771.345181@quad.stoffel.home>
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
Cc: axboe@kernel.dk, linux-raid@vger.kernel.org, snitzer@redhat.com,
	linux-block@vger.kernel.org, song@kernel.org,
	dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 1/4] block: introduce
	submit_bio_noacct_add_head
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 30/12/2020 17:06, John Stoffel wrote:
> Danny> "Provide a way for stacking block device to re-submit
> 
> Danny> the bio which should be handled first."
> 
> Danny> I will fix it.
> 
> Great, though my second question is*why*  it needs to be handled
> first?  What is the difference between stacked and un-stacked devices
> and how could it be done in a way that doesn't require a seperate
> function like this?

Is this anything to do with what's on my mind as a database guy? I've 
heard that things like RAID and LVM have difficulty providing write 
barriers.

I want to be confident that, at EVERY level of the stack, I can put a 
barrier in that guarantees that everything written by user-space BEFORE 
the barrier is handled before anything written AFTER the barrier. That 
way, I can be confident that, after a problem, I know whether I can 
safely roll the log forward or back.

Cheers,
Wol

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

