Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F658702C
	for <lists+dm-devel@lfdr.de>; Mon,  1 Aug 2022 20:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659377115;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ej8yJelt+K6iLXReGNPsUCctjEq3bLU+dDGlyjx37LE=;
	b=Rb4sTkEhCWzh6R1FspSy1OH0vPEf8TpdOKWVgghfv6E/dKglQcvapEnhLV80B9F9o+Y/ww
	suXjzZDzyw3MPWOENeMlmUmc32whpf5k/lqgCf0SRcAEt2m8t5fWLLZNasQOSYlxlwmBq9
	QHl6x3JzdTOpGayAv6i3/yq+VmuBAy0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-roRj4ysXP228DTf3cuDhTw-1; Mon, 01 Aug 2022 14:05:13 -0400
X-MC-Unique: roRj4ysXP228DTf3cuDhTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1BE81C288C9;
	Mon,  1 Aug 2022 18:05:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 439B1906B9;
	Mon,  1 Aug 2022 18:05:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5289C1946A50;
	Mon,  1 Aug 2022 18:05:05 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 750E51946A40
 for <dm-devel@listman.corp.redhat.com>; Mon,  1 Aug 2022 18:05:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 67A78492CA2; Mon,  1 Aug 2022 18:05:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 641DB492C3B
 for <dm-devel@redhat.com>; Mon,  1 Aug 2022 18:05:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FCAE823F09
 for <dm-devel@redhat.com>; Mon,  1 Aug 2022 18:05:04 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-cPVW5ccGOO6ngHSzPaXVYQ-1; Mon, 01 Aug 2022 14:05:02 -0400
X-MC-Unique: cPVW5ccGOO6ngHSzPaXVYQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id A198B68AFE; Mon,  1 Aug 2022 20:04:58 +0200 (CEST)
Date: Mon, 1 Aug 2022 20:04:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20220801180458.GA17425@lst.de>
References: <20220729062356.1663513-1-yukuai1@huaweicloud.com>
 <20220729062356.1663513-2-yukuai1@huaweicloud.com>
 <Yue2rU2Y+xzvGU6x@kroah.com>
MIME-Version: 1.0
In-Reply-To: <Yue2rU2Y+xzvGU6x@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [dm-devel] [PATCH stable 5.10 1/3] block: look up holders by
 bdev
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: axboe@kernel.dk, snitzer@redhat.com, yi.zhang@huawei.com,
 stable@vger.kernel.org, linux-block@vger.kernel.org,
 Yu Kuai <yukuai1@huaweicloud.com>, dm-devel@redhat.com, yukuai3@huawei.com,
 hch@lst.de
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 01, 2022 at 01:19:09PM +0200, Greg KH wrote:
> This is very different from the upstream version, and forces the change
> onto everyone, not just those who had CONFIG_BLOCK_HOLDER_DEPRECATED
> enabled like was done in the main kernel tree.
> 
> Why force this on all and not just use the same option?

I'm really worried about backports that are significantly different
from the original commit.  To the point where if they are so different
and we don't have a grave security or data integrity bug I'm really not
very much in favor of backporting them at all.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

