Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D22D3249887
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 10:49:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-Q9JYPocvO02iBUP-POmeYg-1; Wed, 19 Aug 2020 04:49:20 -0400
X-MC-Unique: Q9JYPocvO02iBUP-POmeYg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B65301DDF7;
	Wed, 19 Aug 2020 08:49:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5651C1014186;
	Wed, 19 Aug 2020 08:49:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A50AD4EE16;
	Wed, 19 Aug 2020 08:49:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07J8n7Nn019231 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 04:49:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3495E2016F2C; Wed, 19 Aug 2020 08:49:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30140203B864
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 08:49:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57095811E81
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 08:49:04 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-421-QcRWnKOtNc6y_BCA4cMkrA-1; Wed, 19 Aug 2020 04:49:01 -0400
X-MC-Unique: QcRWnKOtNc6y_BCA4cMkrA-1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id CFDFFC7780886E5337BC;
	Wed, 19 Aug 2020 16:48:57 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Wed, 19 Aug 2020
	16:48:52 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, <dm-devel@redhat.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
	<178ce8f8-cf74-bb32-1e5c-41674f493a24@huawei.com>
	<9e4b52381f72c8ba6bae6b614daa26cc82ede88d.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <24599c4c-7cf8-f92e-fd75-c4ac47ac4e89@huawei.com>
Date: Wed, 19 Aug 2020 16:48:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9e4b52381f72c8ba6bae6b614daa26cc82ede88d.camel@suse.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Subject: Re: [dm-devel] [PATCH 4/5] multipathd: disable queueing for
 recreated map in uev_remove_map
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Martin:
    In history, the deadlock has happened. When I review patchs made by
huawei employees before me, I think this should be sent to upstream.
It is made in May 2018, so I don't know more details. I'm sorry for that.

On 2020/8/19 3:23, Martin Wilck wrote:
> Hi Lixiaokeng,
> 
> 
> A map which is removed and not yet re-added again (as far as udev is
> concerned) doesn't need to queue because it can't possibly be in use.
> So I think the patch can't hurt in other scenarios, at it makes sense
> in the situation you describe. However I have a few questions.
> 
> Have you observed this, or is it theory? I'm wondering: After 2) there
> should be some paths again, so why would the udev workers hang? 
> I guess this could happen if the regenerated paths all in failed /
> standby state, is that what you mean?
> 
> Note also that we set DM_NOSCAN in the udev rules when there are no
> usable paths, so udev workers would only hang if the last path fails /
> is removed after the "multipath -U" check.
> 
> You've certainly hit a weak spot here, and you've nicely described a
> potential problem scenario. The delayed processing of uevents that
> multipathd triggered itself is a recurring cause of headache.
> 
> Regards,
> Martin
> 
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

