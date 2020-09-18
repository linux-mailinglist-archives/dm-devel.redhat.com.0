Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A32F526FB34
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 13:16:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-p_tKIpglNcGy6EHJ823tfQ-1; Fri, 18 Sep 2020 07:16:05 -0400
X-MC-Unique: p_tKIpglNcGy6EHJ823tfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D6251882FC7;
	Fri, 18 Sep 2020 11:15:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A17173675;
	Fri, 18 Sep 2020 11:15:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B723644A7F;
	Fri, 18 Sep 2020 11:15:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08IBFRGY012916 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 07:15:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEA3E117C00; Fri, 18 Sep 2020 11:15:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA1C8115E1F
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 11:15:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 984B585828F
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 11:15:25 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-73-42-y4VosNq60A5_H275hZQ-1;
	Fri, 18 Sep 2020 07:15:22 -0400
X-MC-Unique: 42-y4VosNq60A5_H275hZQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F3A93ABF4;
	Fri, 18 Sep 2020 11:15:54 +0000 (UTC)
Message-ID: <473373836362e808c1d856048ce06a27487b31bb.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Date: Fri, 18 Sep 2020 13:15:19 +0200
In-Reply-To: <3735c20d-a0fd-ca41-be9a-0df679022668@huawei.com>
References: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
	<20200918022626.GU11108@octiron.msp.redhat.com>
	<011310221c816f3c3573d96d91aca3e0a48fb80d.camel@suse.com>
	<3735c20d-a0fd-ca41-be9a-0df679022668@huawei.com>
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
Cc: dm-devel, list <dm-devel@redhat.com>, linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 0/6] libmultipath: check udev* func return
	value
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-18 at 16:39 +0800, lixiaokeng wrote:
> 
>    Here we use multipath-tools basing on iscsi. When iscsi logout,
> the path
> will disappear in sysfs and a uevent will cause. Before uevent
> processed,
> some coredump will happen but if coredump is solved the multipathd
> will
> deal with the disappeared path latter.
>   In this set, the funcs will not be processed when multipath-tools
> bases
> on iscsi. However, I think multipathd will deal with the disappeared
> path
> like basing on iscsi. So I just check them. Anyway, if you have any
> better
> idea, please tell me.

Of course we need to avoid the segfaults. As I said, please fix your
patches and resend. It's good to know that just avoiding the NULL
dereferences fixes the issues you were seeing.

Perhaps it would be sufficient to set INIT_REMOVED on a path device
when something like this happens. But I need to think it through.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

