Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C851057CDBC
	for <lists+dm-devel@lfdr.de>; Thu, 21 Jul 2022 16:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658414066;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6nM3/amWClz1jQnvozWSQWHJbZDBfzWUeH6FFca4fUs=;
	b=E2F/M5qLsA87LEz2IDdSJvf1CLi6TxYLU+Tjs/A2E24wPGwYybKUz7cIcQt+N4+YZNcNl3
	6o2PWZSboMaoA08NafAOcBR07hN5lDDG3pNpIwulTmIiuwyfbpL9tx7+Kwai9H/br+GZ2E
	kLJ4kKNRLYx9SzB3MirFBcY961El2Yo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-CjyfyCo7NYSm1AM1NMqFeA-1; Thu, 21 Jul 2022 10:34:24 -0400
X-MC-Unique: CjyfyCo7NYSm1AM1NMqFeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C706A1035345;
	Thu, 21 Jul 2022 14:34:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F1C714583C0;
	Thu, 21 Jul 2022 14:34:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3EBBF19451F2;
	Thu, 21 Jul 2022 14:34:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7703F1947040
 for <dm-devel@listman.corp.redhat.com>; Thu, 21 Jul 2022 14:34:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 44717492C3B; Thu, 21 Jul 2022 14:34:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31AB8492CA5;
 Thu, 21 Jul 2022 14:34:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 26LEYBxv015333;
 Thu, 21 Jul 2022 09:34:12 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 26LEYBMP015332;
 Thu, 21 Jul 2022 09:34:11 -0500
Date: Thu, 21 Jul 2022 09:34:10 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Wu Guanghao <wuguanghao3@huawei.com>
Message-ID: <20220721143410.GZ10602@octiron.msp.redhat.com>
References: <4a5b490d-6361-a745-9e4c-0fe240c8b93f@huawei.com>
MIME-Version: 1.0
In-Reply-To: <4a5b490d-6361-a745-9e4c-0fe240c8b93f@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [dm-devel] [Question] multipathd add/remove paths takes a long
 time
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
Cc: lixiaokeng@huawei.com, liuxing108@huawei.com, zhangying134@huawei.com,
 chenmao2@huawei.com, liuzhiqiang26@huawei.com, linfeilong@huawei.com,
 dm-devel@redhat.com, Christophe Varoqui <christophe.varoqui@opensvc.com>,
 mwilck@suse.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 19, 2022 at 08:13:39PM +0800, Wu Guanghao wrote:
> The system has 1K multipath devices, each device has 16 paths.
> Execute multipathd add/multipathd remove or uev_add_path/
> uev_remove_path to add/remove paths, which takes over 20s.
> What's more, the second checkloop may be execed immediately
> after finishing first checkloop. It's too long.
> 
> We found that time was mostly spent waiting for locks.
> 
> checkerloop(){
> 	...
> 	lock(&vecs->lock);
> 	vector_foreach_slot (vecs->pathvec, pp, i) {
> 		rc = check_path(...); // Too many paths, it takes a long time
> 		...
> 	}
> 	lock_cleanup_pop(vecs->lock);
> 	...
> }
> 
> Can the range of vecs->lock locks be adjusted to reduce the time consuming
> when adding/removing paths?

As long as we make sure not to skip any paths or double-check any paths,
we don't need to hold the vecs->lock between checking paths. There is
certainly some optimization that could get done here.

could you post the output of:

# multipath -l <sample_multipath_device>
# multipathd show config local

-Ben
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

