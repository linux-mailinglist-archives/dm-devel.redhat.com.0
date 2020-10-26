Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AE0AC298C3A
	for <lists+dm-devel@lfdr.de>; Mon, 26 Oct 2020 12:49:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-3WRVoEtmNqGqqOVVBoGVxg-1; Mon, 26 Oct 2020 07:49:33 -0400
X-MC-Unique: 3WRVoEtmNqGqqOVVBoGVxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08845804B7A;
	Mon, 26 Oct 2020 11:49:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C2E60C07;
	Mon, 26 Oct 2020 11:49:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B389092F21;
	Mon, 26 Oct 2020 11:49:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09QBiD0N018033 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 07:44:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87AA0110FBFE; Mon, 26 Oct 2020 11:44:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83B71110FBFC
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 11:44:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42CAE102F1E1
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 11:44:11 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com
	[45.249.212.191]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-151-DcQzfVZPPvaF-LrJ0IV9UA-1; Mon, 26 Oct 2020 07:44:06 -0400
X-MC-Unique: DcQzfVZPPvaF-LrJ0IV9UA-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CKXzp4hDVzLp3f;
	Mon, 26 Oct 2020 19:44:06 +0800 (CST)
Received: from [10.174.178.210] (10.174.178.210) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 26 Oct 2020 19:43:51 +0800
To: Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
References: <2a95503c-da40-391c-ce76-bdde19636b51@huawei.com>
	<6b99062343bcbf097421d5a3f12b96ebe32cdcb8.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <3b310e1e-9e28-2d2c-a275-9247ed542141@huawei.com>
Date: Mon, 26 Oct 2020 19:43:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6b99062343bcbf097421d5a3f12b96ebe32cdcb8.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 0/6] multipath-tools history bug in 0.4.9
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> 
> Thanks for the patches, but unless you can provide evidence that the
> issues are still present in recent upstream code, we likely won't
> bother with this on dm-devel. Please report this to the distribution(s)
> you are using that are still shipping the old multipath-tools versions.
> 
> Regards,
> Martin
> 
Hi
  Martin. Thanks for your reply. I'm sorry for sending these old patches.
Before these patches, I sent two patch "libmultipath: fix memory leaks in
coalesce_paths" (v2) and "libmultipath: call udev_device_unref before
return". But I did not get a reply. Do you notice them?

Regards,
Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

