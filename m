Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E0F1C3037FB
	for <lists+dm-devel@lfdr.de>; Tue, 26 Jan 2021 09:35:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-CZl1gFR7PHOYfbeH16eBuw-1; Tue, 26 Jan 2021 03:35:30 -0500
X-MC-Unique: CZl1gFR7PHOYfbeH16eBuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71AD584A5E3;
	Tue, 26 Jan 2021 08:35:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60FD772160;
	Tue, 26 Jan 2021 08:35:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 647564BB7B;
	Tue, 26 Jan 2021 08:35:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10Q8Ywvj030302 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 03:34:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8E25E8A4A7; Tue, 26 Jan 2021 08:34:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 882628A4B0
	for <dm-devel@redhat.com>; Tue, 26 Jan 2021 08:34:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14DCD805B01
	for <dm-devel@redhat.com>; Tue, 26 Jan 2021 08:34:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-2-TWQYTHi2PR6H546iWOFTFg-1;
	Tue, 26 Jan 2021 03:34:53 -0500
X-MC-Unique: TWQYTHi2PR6H546iWOFTFg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 45EB8AF85;
	Tue, 26 Jan 2021 08:34:52 +0000 (UTC)
Message-ID: <d592fd0d5eeb2a0a865a395b456e24fc5a359ebf.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Tue, 26 Jan 2021 09:34:51 +0100
In-Reply-To: <621a2062-b6eb-d88d-e53a-9c0a6b19cfbb@huawei.com>
References: <621a2062-b6eb-d88d-e53a-9c0a6b19cfbb@huawei.com>
User-Agent: Evolution 3.38.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, hexiaowen@huawei.com
Subject: Re: [dm-devel] [QUESTION] multipathd crash when stopping
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-26 at 14:50 +0800, lixiaokeng wrote:
> When stopping multipathd (systemctl restart multipathd.service),
> there
> is a multipathd crash occasionally(not reproduced).

If this happens only during shutdown, it might be related to thread
cancellation. Can you try disabling cancellation for the
udev_monitor_receive_device() call?


    int oldstate;

    pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &oldstate);

    udev_monitor_receive_device(...)

    pthread_setcancelstate(oldstate, NULL);
    pthread_testcancel();

In general, running multipathd under valgrind might help finding the
issue. 

But valgrind will slow down multipathd drastically, so timings will
change, and it's not granted that the problem will still be
reproducable. Alternatively, you can work with -fsanitize=address, but
in this specific case you'd need to compile libudev with this option,
too.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

