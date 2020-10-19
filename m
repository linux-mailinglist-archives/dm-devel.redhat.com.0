Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 80AD0292553
	for <lists+dm-devel@lfdr.de>; Mon, 19 Oct 2020 12:18:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-qIQLQBOPOkapcv3SsC9zuQ-1; Mon, 19 Oct 2020 06:17:58 -0400
X-MC-Unique: qIQLQBOPOkapcv3SsC9zuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3519D879513;
	Mon, 19 Oct 2020 10:17:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 183935C22A;
	Mon, 19 Oct 2020 10:17:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88E898C7A7;
	Mon, 19 Oct 2020 10:17:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JAHOEm012559 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 06:17:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B7A8101C495; Mon, 19 Oct 2020 10:17:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 262F51009B82
	for <dm-devel@redhat.com>; Mon, 19 Oct 2020 10:17:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEDB1800186
	for <dm-devel@redhat.com>; Mon, 19 Oct 2020 10:17:19 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-275-WQR9KZh-PSqTMt7uPEfJIA-1; Mon, 19 Oct 2020 06:17:17 -0400
X-MC-Unique: WQR9KZh-PSqTMt7uPEfJIA-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 12B16C6EEF65309B6771;
	Mon, 19 Oct 2020 18:17:13 +0800 (CST)
Received: from [10.174.178.210] (10.174.178.210) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 19 Oct 2020 18:17:02 +0800
To: Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
References: <6169bcfa-343d-adc8-a458-5e5c46aed737@huawei.com>
	<757aa2249e036cf2c659bedd6c9fe748af3c0894.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <4aca3d1d-eade-8fbc-04f2-6b8f17382d1b@huawei.com>
Date: Mon, 19 Oct 2020 18:17:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <757aa2249e036cf2c659bedd6c9fe748af3c0894.camel@suse.com>
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
Subject: Re: [dm-devel] [PATCH] libmultipath: fix memory leaks in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2020/10/17 3:51, Martin Wilck wrote:
> On Fri, 2020-10-16 at 14:23 +0800, lixiaokeng wrote:
>> When multipath -F are executed firstly and multipath -v2 or
>> -d are executed later, asan will warn memory leaks. The
>> reason is that the mpp allocated in coalesce_paths isn't
>> freed. Here we add newmp in configure(multipath) to store
>> mpp and free it.
>>
>> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> 
> Besides what Ben noted already, I think you shouldn't force callers to
> pass a non-NULL "newmp". The tricky part is to make sure that paths
> aren't handled repeatedly in the CMD_DRY_RUN case. Currently pp->mpp !=
> NULL is the condition used by coalesce_paths() to check if a path has
> already been dealt with; if you simply call remove_map(), that won't
> work any more. I suppose you realized that, and that's why you
> introduced the non-NULL newmp in multipath (you should have mentioned
> that in the changelog message).
> 
> I suggest to have callers pass a "vector *pnewmp" instead of "vector
> newmp", always allocate newmp in coalesce_paths(), and upon return,
> either free newmp, or assign it to the pointer passed by the caller:
> 
>      if (pnewmp)
> 	    *pnewmp = newmp;
>      else
>             free_multipathvec(newmp, KEEP_PATHS);
> 
> Regards,
> Martin
>
Hi Martin,
   Thanks for your review. It is a great idea with your suggestion.
I think it's better that callers pass a "vector mpvec" instead of
"vector newmp", either copy mpvec to newmp or allocate newmp at the
beginning of coalesce_paths, and free newmp or not at the end:

int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
		    int force_reload, enum mpath_cmds cmd)
	......

 	if (mpvec)
		newmp = mpvec;
	else
		newmp = vector_alloc();
	if (!newmp) {
		condlog(0, "can not allocate newmp");
		return ret;
	}
	......
	
 	if (!mpvec)
		free_multipathvec(newmp, KEEP_PATHS);

About conflict, can you give me the url of the code with your
patchset? If I just change coalease_paths, will it have some
conflicts?

Regards,
Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

