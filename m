Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C037C2407A6
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 16:35:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-43kTolYWOu6Q5SIiEfdRkg-1; Mon, 10 Aug 2020 10:35:17 -0400
X-MC-Unique: 43kTolYWOu6Q5SIiEfdRkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFB948014D7;
	Mon, 10 Aug 2020 14:35:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8CBA5F1E4;
	Mon, 10 Aug 2020 14:35:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C37AD1809554;
	Mon, 10 Aug 2020 14:35:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AEYpOA000814 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 10:34:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21E43208DD86; Mon, 10 Aug 2020 14:34:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D7E9208DD83
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 14:34:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04D38803888
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 14:34:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-548-2-t506C1Mtal6HjDwDusqg-1;
	Mon, 10 Aug 2020 10:34:45 -0400
X-MC-Unique: 2-t506C1Mtal6HjDwDusqg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AAADDB5D4;
	Mon, 10 Aug 2020 14:35:03 +0000 (UTC)
Message-ID: <140e431094a118a5276f6964921cc120bda2dc49.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, linfeilong@huawei.com,
	Yanxiaodan <yanxiaodan@huawei.com>, lixiaokeng <lixiaokeng@huawei.com>
Date: Mon, 10 Aug 2020 16:34:42 +0200
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
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
Cc: dm-devel@redhat.com
Subject: [dm-devel] Recent multipath-tools patches from Huawei
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Liu,

thanks again for your valuable contributions and meticulous code
review. I've added your patches in my upstream-queue branch now:

https://github.com/openSUSE/multipath-tools/commits/upstream-queue

Not applied yet: 

 - libmultipath: free pp if store_path fails in disassemble_map:
   As noted before, this will be merged with my series for
   disassemble_map().
 - libmultipath: fix a memory leak in set_ble_device:
   Please fix minor issues I mentioned
 - vector: return null when realloc fails in vector_alloc_slot func
   Needs improvement

Please double-check if I've missed anything. 

Next time, please send your patches as a series. That makes it
much easier for others to make sure they don't miss any.
And please, don't add "[dm-devel]" explicitly in your email
subject, mailman will take care of that.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

