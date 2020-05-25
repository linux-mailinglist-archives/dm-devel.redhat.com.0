Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 59F591E1228
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 17:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590422181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4BnBl0WSqkhl39/QJRajzYhrH2n5SUXqHk8uNBpwOxU=;
	b=MheyeiftzKsynaPqK+ORxxMH7crdPB+JNfz4NnGVZVBmkAoF++u2zotGaDq8lWlutrdh6b
	p7rIENRxPe/tN076nUlAIPOJm0pT9aVtiyTH0TY5LBa6RDLqS0GPcmfgnZCsdJf1lCIKPf
	++SiYOAPeJ4GiHjZoveQ6c0tlPDHFBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-v_yBgIy4MsClO9e4QfiZoA-1; Mon, 25 May 2020 11:56:19 -0400
X-MC-Unique: v_yBgIy4MsClO9e4QfiZoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FE841005510;
	Mon, 25 May 2020 15:56:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BF2D79C2D;
	Mon, 25 May 2020 15:56:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DA3755322;
	Mon, 25 May 2020 15:55:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04PCYWU4010301 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 08:34:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D7921134CC6; Mon, 25 May 2020 12:34:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 196AA1134CC3
	for <dm-devel@redhat.com>; Mon, 25 May 2020 12:34:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 661FF101A525
	for <dm-devel@redhat.com>; Mon, 25 May 2020 12:34:28 +0000 (UTC)
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
	[5.45.199.163]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-151-kjByTKUeMDO4QROa2EjsFw-1; Mon, 25 May 2020 08:34:25 -0400
X-MC-Unique: kjByTKUeMDO4QROa2EjsFw-1
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::162])
	by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id C52572E1499;
	Mon, 25 May 2020 15:34:23 +0300 (MSK)
Received: from iva8-88b7aa9dc799.qloud-c.yandex.net
	(iva8-88b7aa9dc799.qloud-c.yandex.net
	[2a02:6b8:c0c:77a0:0:640:88b7:aa9d])
	by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
	ZJIXPPS6z9-YLTi9Z9T; Mon, 25 May 2020 15:34:23 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
	[2a02:6b8:b081:603::1:c])
	by iva8-88b7aa9dc799.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA
	id O3BMKGQlP9-YLXqqoTf; Mon, 25 May 2020 15:34:21 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20200525113014.345997-1-hch@lst.de>
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Message-ID: <81f4057b-124a-d0e7-94af-15a198d48d50@yandex-team.ru>
Date: Mon, 25 May 2020 15:34:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525113014.345997-1-hch@lst.de>
Content-Language: en-CA
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 25 May 2020 11:55:47 -0400
Cc: linux-nvdimm@lists.01.org, linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Minchan Kim <minchan@kernel.org>, dm-devel@redhat.com,
	drbd-dev@tron.linbit.com, Nitin Gupta <ngupta@vflare.org>
Subject: Re: [dm-devel] block I/O accounting improvements
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 25/05/2020 14.29, Christoph Hellwig wrote:
> Hi Jens,
> 
> they series contains various improvement for block I/O accounting.  The
> first bunch of patches switch the bio based drivers to better accounting
> helpers compared to the current mess.  The end contains a fix and various
> performanc improvements.  Most of this comes from a series Konstantin
> sent a few weeks ago, rebased on changes that landed in your tree since
> and my change to always use the percpu version of the disk stats.
> 

Thanks for picking this up.

One note about possible further improvement in reply to first patch.

Reviewed-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

