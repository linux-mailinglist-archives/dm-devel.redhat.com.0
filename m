Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 079B8257B6B
	for <lists+dm-devel@lfdr.de>; Mon, 31 Aug 2020 16:40:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-WAks0q0YO7yAHbREwafszQ-1; Mon, 31 Aug 2020 10:40:47 -0400
X-MC-Unique: WAks0q0YO7yAHbREwafszQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E30C7100CEC2;
	Mon, 31 Aug 2020 14:40:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5E895D9D3;
	Mon, 31 Aug 2020 14:40:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C62ED79A07;
	Mon, 31 Aug 2020 14:40:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VEblPd001370 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 10:37:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 67A3242AB8; Mon, 31 Aug 2020 14:37:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62CA342AAA
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 14:37:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DB0580121F
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 14:37:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-77-bQQHRHVhPyWhefkfdYuIAQ-1;
	Mon, 31 Aug 2020 10:37:40 -0400
X-MC-Unique: bQQHRHVhPyWhefkfdYuIAQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0DAB1B1F7;
	Mon, 31 Aug 2020 14:37:39 +0000 (UTC)
Message-ID: <dd407fdd07d2f03429c9528d5b296e1823031112.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Date: Mon, 31 Aug 2020 16:37:38 +0200
In-Reply-To: <c31619f2-93e6-f317-809c-828026e6ee03@huawei.com>
References: <dc4f5730-157f-8a27-247c-628f38bb6cb5@huawei.com>
	<c31619f2-93e6-f317-809c-828026e6ee03@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, yanxiaodan@huawei.com,
	linfeilong@huawei.com, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH V3 1/5] multipathd: adopt static char* arr in
 daemon_status
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-08-29 at 11:03 +0800, Zhiqiang Liu wrote:
> We adopt static char* array (demon_status_msg) in daemon_status func,
> so it looks more simpler and easier to expand.
> 
> V2->V3:
> - add default case in sd_notify_status to fix compile error
> V1->V2:
> - use "int" as the type of "status" (suggested by Martin)
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  multipathd/main.c | 32 +++++++++++++++++---------------
>  multipathd/main.h |  3 ++-
>  2 files changed, 19 insertions(+), 16 deletions(-)
> 

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

