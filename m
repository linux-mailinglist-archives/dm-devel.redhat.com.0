Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 509092A2332
	for <lists+dm-devel@lfdr.de>; Mon,  2 Nov 2020 03:55:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-KoaXKxOrMaSkAeeB0ut54w-1; Sun, 01 Nov 2020 21:55:54 -0500
X-MC-Unique: KoaXKxOrMaSkAeeB0ut54w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A59871006C83;
	Mon,  2 Nov 2020 02:55:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D51925B4AF;
	Mon,  2 Nov 2020 02:55:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9045A8C7A5;
	Mon,  2 Nov 2020 02:55:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A22tYfa025732 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 1 Nov 2020 21:55:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2301B205EB11; Mon,  2 Nov 2020 02:55:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E5F6205EB1A
	for <dm-devel@redhat.com>; Mon,  2 Nov 2020 02:55:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A27CE858296
	for <dm-devel@redhat.com>; Mon,  2 Nov 2020 02:55:31 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-228-YRVdXq40OZioVjSXWWp5Cw-1; Sun, 01 Nov 2020 21:55:29 -0500
X-MC-Unique: YRVdXq40OZioVjSXWWp5Cw-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CPcVC4rycz71vG;
	Mon,  2 Nov 2020 10:36:03 +0800 (CST)
Received: from [10.174.178.210] (10.174.178.210) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 2 Nov 2020 10:35:55 +0800
To: Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
References: <adb9eb05-0597-5027-701d-861e273da9e4@huawei.com>
	<ad0e21d3cfe99c0361effe4d9b9c177ca1998e7f.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <1e3bf3f4-74e3-a522-0cbc-1c3d8fa447a5@huawei.com>
Date: Mon, 2 Nov 2020 10:35:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ad0e21d3cfe99c0361effe4d9b9c177ca1998e7f.camel@suse.com>
X-Originating-IP: [10.174.178.210]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH v2] libmultipath: fix memory leaks in
	coalesce_paths
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/11/2 5:23, Martin Wilck wrote:
> Previously, this code, which flushes maps that aren't valid any more,
> would only be called from multipathd() -> reconfigure(), because in all
> other cases newmp was NULL.
> 
> AFAICS, you will now call dm_flush_map() even if called with
> newmp==NULL (this means, from cli_add_map(), or from multipath, even if
> called with CMD_DRY_RUN). I don't think that's what we want.
Hi
 Thanks for your review. I will change my patch to make sure dm_flush_map()
is called only when mpvec (newmp in old code) is not NULL. Thanks for your
advice again.

Regards,
Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

