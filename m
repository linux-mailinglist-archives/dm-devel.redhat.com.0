Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id C36F62315EC
	for <lists+dm-devel@lfdr.de>; Wed, 29 Jul 2020 01:03:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-TOKOL54bPbOUlb6tC9JeaA-1; Tue, 28 Jul 2020 19:03:14 -0400
X-MC-Unique: TOKOL54bPbOUlb6tC9JeaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BB148017FB;
	Tue, 28 Jul 2020 23:03:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 645E1712F9;
	Tue, 28 Jul 2020 23:03:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ACB58A3599;
	Tue, 28 Jul 2020 23:02:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SN2cC9030754 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 19:02:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF936200AA63; Tue, 28 Jul 2020 23:02:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBCFA218ADC8
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 23:02:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B53571012449
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 23:02:35 +0000 (UTC)
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-298-opDM8XYjOrKwuvHZFeKMdg-1; Tue, 28 Jul 2020 19:02:33 -0400
X-MC-Unique: opDM8XYjOrKwuvHZFeKMdg-1
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1k0YGR-004arw-Eo; Tue, 28 Jul 2020 22:40:03 +0000
Date: Tue, 28 Jul 2020 23:40:03 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <20200728224003.GC951209@ZenIV.linux.org.uk>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200728213614.586312-6-deven.desai@linux.microsoft.com>
	<ef0fff6f-410a-6444-f1e3-03499a2f52b7@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <ef0fff6f-410a-6444-f1e3-03499a2f52b7@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com, sashal@kernel.org,
	paul@paul-moore.com, corbet@lwn.net, jmorris@namei.org,
	nramas@linux.microsoft.com, serge@hallyn.com,
	pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, axboe@kernel.dk,
	mdsakib@microsoft.com, linux-kernel@vger.kernel.org,
	eparis@redhat.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 05/11] fs: add security blob and hooks
 for block_device
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 28, 2020 at 03:22:59PM -0700, Casey Schaufler wrote:

> > +	hlist_for_each_entry(p, &security_hook_heads.bdev_setsecurity, list) {
> > +		rc = p->hook.bdev_setsecurity(bdev, name, value, size);
> > +
> > +		if (rc == -ENOSYS)
> > +			rc = 0;
> > +
> > +		if (rc != 0)
> 
> Perhaps:
> 		else if (rc != 0)
> 
> > +			break;
> > +	}
> > +
> > +	return rc;

	hlist_for_each_entry(p, &security_hook_heads.bdev_setsecurity, list) {
		rc = p->hook.bdev_setsecurity(bdev, name, value, size);
		if (rc && rc != -ENOSYS)
			return rc;
	}
	return 0;

Easier to reason about that way...

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

