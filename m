Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 42A0324191B
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 11:50:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-xbeeFgUGNaqQ_h7KtxQ0Fg-1; Tue, 11 Aug 2020 05:50:16 -0400
X-MC-Unique: xbeeFgUGNaqQ_h7KtxQ0Fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ABE5100AA2B;
	Tue, 11 Aug 2020 09:50:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A34025F1EA;
	Tue, 11 Aug 2020 09:50:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBDCB1809554;
	Tue, 11 Aug 2020 09:50:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07B9o36N014992 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 05:50:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC7932166BA3; Tue, 11 Aug 2020 09:50:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC6BE2166BA0
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 09:50:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 461698007D7
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 09:50:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-408--me-Cu8KML-OytMrEk6G9w-1;
	Tue, 11 Aug 2020 05:49:57 -0400
X-MC-Unique: -me-Cu8KML-OytMrEk6G9w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8BA6DABE2;
	Tue, 11 Aug 2020 09:50:16 +0000 (UTC)
Message-ID: <eba3738594596c3e7d37ae6b8c2f35e9592864a8.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, linfeilong@huawei.com,
	Yanxiaodan <yanxiaodan@huawei.com>, lixiaokeng <lixiaokeng@huawei.com>
Date: Tue, 11 Aug 2020 11:49:54 +0200
In-Reply-To: <60d7ea82-22ed-16f5-de7f-8280b90eeb7f@huawei.com>
References: <140e431094a118a5276f6964921cc120bda2dc49.camel@suse.com>
	<60d7ea82-22ed-16f5-de7f-8280b90eeb7f@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] Recent multipath-tools patches from Huawei
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

On Tue, 2020-08-11 at 09:14 +0800, Zhiqiang Liu wrote:
> 
> On 2020/8/10 22:34, Martin Wilck wrote:
> > Hi Liu,
> > 
> > thanks again for your valuable contributions and meticulous code
> > review. I've added your patches in my upstream-queue branch now:
> > 
> > https://github.com/openSUSE/multipath-tools/commits/upstream-queue
> > 
> > Not applied yet: 
> > 
> >  - libmultipath: free pp if store_path fails in disassemble_map:
> >    As noted before, this will be merged with my series for
> >    disassemble_map().
> >  - libmultipath: fix a memory leak in set_ble_device:
> >    Please fix minor issues I mentioned
> >  - vector: return null when realloc fails in vector_alloc_slot func
> >    Needs improvement
> > 
> > Please double-check if I've missed anything. 
> > 
> > Next time, please send your patches as a series. That makes it
> > much easier for others to make sure they don't miss any.
> > And please, don't add "[dm-devel]" explicitly in your email
> > subject, mailman will take care of that.
> > 
> > Regards
> > Martin
> > 
> Thanks for your advise.
> I have checked recent patches. The following patch may be missed.
> - libmultipath: free pgp if add_pathgroup fails in disassemble_map
> func

Right. Sorry for overlooking it, I pushed it now.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

