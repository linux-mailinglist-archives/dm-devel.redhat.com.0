Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2679D1ED0BD
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 15:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591190771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9zXug12zJSm3rpPgwo92nGDB7aZaKrv3Z1GVsW2nM80=;
	b=LVMVWLRUViuDoldMFuKwgKlpY0CQYUc4xPvUNrIlx95W+cv9a9E5sVCHxvb7VIUUGlBdnr
	RDixgoEvNEUqkvsnIMuck8vT6NrffbY2//YTkdyCeAe4KFq7bpbLrkiBnM327TEkMGD3uw
	j4YBu4AQs3q2MwanesPgr8f7fwak9J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-c_GheX65PQG0cJLkKJkJ2g-1; Wed, 03 Jun 2020 09:26:08 -0400
X-MC-Unique: c_GheX65PQG0cJLkKJkJ2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6987A1883608;
	Wed,  3 Jun 2020 13:26:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A5D878F18;
	Wed,  3 Jun 2020 13:26:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01E591809554;
	Wed,  3 Jun 2020 13:26:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0538PB3G026082 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jun 2020 04:25:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0DB4AD1EA5; Wed,  3 Jun 2020 08:25:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 048E42EF94
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 08:25:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 047C5811E77
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 08:25:09 +0000 (UTC)
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
	[77.88.29.217]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-265-kryLcVNiNY2g1Ik1phU2Vg-1; Wed, 03 Jun 2020 04:25:06 -0400
X-MC-Unique: kryLcVNiNY2g1Ik1phU2Vg-1
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::162])
	by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 2525C2E1577;
	Wed,  3 Jun 2020 11:25:04 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
	(vla1-81430ab5870b.qloud-c.yandex.net
	[2a02:6b8:c0d:35a1:0:640:8143:ab5])
	by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
	e8ZNCm3DrZ-P1B8bnrV; Wed, 03 Jun 2020 11:25:04 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
	[2a02:6b8:b080:7216::1:b])
	by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA
	id YEeyNlG2dn-P1WmCXdR; Wed, 03 Jun 2020 11:25:01 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
To: Christoph Hellwig <hch@infradead.org>
References: <159101473169.180989.12175693728191972447.stgit@buzz>
	<159101502963.180989.6228080995222059011.stgit@buzz>
	<20200603045822.GA17137@infradead.org>
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Message-ID: <2a58bc7a-0aad-3f40-cb8e-db9cb88f9df4@yandex-team.ru>
Date: Wed, 3 Jun 2020 11:24:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603045822.GA17137@infradead.org>
Content-Language: en-CA
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 03 Jun 2020 09:25:45 -0400
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH RFC 1/3] block: add flag 'nowait_requests'
 into queue limits
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 03/06/2020 07.58, Christoph Hellwig wrote:
> On Mon, Jun 01, 2020 at 03:37:09PM +0300, Konstantin Khlebnikov wrote:
>> Add flag for marking bio-based queues which support REQ_NOWAIT.
>> Set for all request based (mq) devices.
>>
>> Stacking device should set it after blk_set_stacking_limits() if method
>> make_request() itself doesn't delay requests or handles REQ_NOWAIT.
> 
> I don't think this belongs into the queue limits.  For example a
> stacking driver that always defers requests to a workqueue can support
> REQ_NOWAIT entirely independent of the underlying devices.  I think
> this just needs to be a simple queue flag.
> 

For O_DIRECT I/O REQ_NOWAIT not just about non-blocking submition.
It also provides instant feedback about contention. Like ECN from network.
This feedback is useful for rate-control and balancing load between replicas.

If upper layer simply remaps and forwards requests below then to forward
contention all layers of stacked device should support this feature.
That's why I've put it as flag into limits - to reuse limits stacking.

If any layer defers request, then it should somehow limit size of backlog
at the same time to provide sane behaviour for REQ_NOWAIT regardless of
behaviour lower devices. So, then it could simply set that flag in limits.

Also I want to add handing into blk-qos/throttler - never delay REQ_NOWAIT.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

