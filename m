Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFFC762B79
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jul 2023 08:33:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690353225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DbhL/C+5+2s3pHltnEGrEbZfudH4n0lTCUg+1X9Poqo=;
	b=PqnywQ7R+ETNHzQAD0qmK3SfndTnYIAvhEbnBphMKfL0B3yIU56eksw9o+5hT6unWcBkgw
	C48GnT73ts/Sgs6uRXO1/pIEm7zOWRVxogdj5lMMadA3HQCvblAzDJpOFbGv9dZ+bKvHqr
	Di6jClazUPiRwunHYA3mP6ecNNBVdYs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-NNKrX5A1M9mxPmUH4TIzjw-1; Wed, 26 Jul 2023 02:33:41 -0400
X-MC-Unique: NNKrX5A1M9mxPmUH4TIzjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15016185A78F;
	Wed, 26 Jul 2023 06:33:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EA61414A80D;
	Wed, 26 Jul 2023 06:33:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AAA4E19451F6;
	Wed, 26 Jul 2023 06:33:29 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1AAA31946589
 for <dm-devel@listman.corp.redhat.com>; Tue, 25 Jul 2023 09:17:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EC87BC2C856; Tue, 25 Jul 2023 09:17:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5008C2C7D3
 for <dm-devel@redhat.com>; Tue, 25 Jul 2023 09:17:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C04D680269A
 for <dm-devel@redhat.com>; Tue, 25 Jul 2023 09:17:17 +0000 (UTC)
Received: from out-35.mta1.migadu.com (out-35.mta1.migadu.com
 [95.215.58.35]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-fdCAgGriMKCJeXBCjX-9MA-1; Tue, 25 Jul 2023 05:17:15 -0400
X-MC-Unique: fdCAgGriMKCJeXBCjX-9MA-1
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-5-zhengqi.arch@bytedance.com>
Date: Tue, 25 Jul 2023 17:16:24 +0800
Message-Id: <AA25C9A6-B2F4-44B4-AF31-B2A2C2A1F867@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-5-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Wed, 26 Jul 2023 06:33:26 +0000
Subject: Re: [dm-devel] [PATCH v2 04/47] kvm: mmu: dynamically allocate the
 x86-mmu shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux Memory Management List <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com,
 Vlastimil Babka <vbabka@suse.cz>, linux-raid@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> Use new APIs to dynamically allocate the x86-mmu shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

