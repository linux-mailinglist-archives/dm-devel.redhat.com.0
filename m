Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A365923D31D
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 22:35:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-wB0ayUtLOnujTb_vOPQqwQ-1; Wed, 05 Aug 2020 16:35:11 -0400
X-MC-Unique: wB0ayUtLOnujTb_vOPQqwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88C6A57;
	Wed,  5 Aug 2020 20:35:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15CC45D9DC;
	Wed,  5 Aug 2020 20:34:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 563051809554;
	Wed,  5 Aug 2020 20:34:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075KYfgd014233 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 16:34:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F6D1207B2B8; Wed,  5 Aug 2020 20:34:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B8A4207B2AB
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 20:34:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56B9480DCD3
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 20:34:38 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-243-CP4iUi1fM3-o8nZNGzidZg-1;
	Wed, 05 Aug 2020 16:34:33 -0400
X-MC-Unique: CP4iUi1fM3-o8nZNGzidZg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 022FBAB3D;
	Wed,  5 Aug 2020 20:34:49 +0000 (UTC)
Message-ID: <31370014486ad4907cb1e443ce9ab8b24b1c0c41.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Chongyun Wu <wu.chongyun@h3c.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 05 Aug 2020 22:34:31 +0200
In-Reply-To: <311e3cc177cb481e872fd8b0909bddfd@h3c.com>
References: <311e3cc177cb481e872fd8b0909bddfd@h3c.com>
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
Cc: Guozhonghua <guozhonghua@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Chengchiwen <chengchiwen@h3c.com>, Wangyong <wang.yongD@h3c.com>,
	Zhangguanghui <zhang.guanghui@h3c.com>
Subject: Re: [dm-devel] [PATCH 00/74] multipath-tools series part V: removed
 path handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-20 at 01:52 +0000, Chongyun Wu wrote:
> Hi Marin and all,
> 
> With below patches, run up/down script for a week, DM IO blocked
> issue not happened again, I think those patches works.
> 
> Tested-by: wuchongyun (Cloud) <wu.chongyun@h3c.com>

Thanks a lot! So the hope I expressed in the cover letter came true :-)
That's good to know, and should be a data point in our discussion about
the right treatment of pathvec.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

