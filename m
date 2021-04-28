Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 952FB36E09B
	for <lists+dm-devel@lfdr.de>; Wed, 28 Apr 2021 22:55:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-STqmT5ktN52LjZ7CB-ojAQ-1; Wed, 28 Apr 2021 16:55:38 -0400
X-MC-Unique: STqmT5ktN52LjZ7CB-ojAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFD2710054F6;
	Wed, 28 Apr 2021 20:55:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A74E36A8EA;
	Wed, 28 Apr 2021 20:55:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D87244A60;
	Wed, 28 Apr 2021 20:55:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13SKt6HY005141 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 28 Apr 2021 16:55:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C96EF10728F; Wed, 28 Apr 2021 20:55:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C376710F04E
	for <dm-devel@redhat.com>; Wed, 28 Apr 2021 20:55:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C559811E93
	for <dm-devel@redhat.com>; Wed, 28 Apr 2021 20:55:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-51-knRGfz32PUqnCNaYisudpQ-1;
	Wed, 28 Apr 2021 16:54:58 -0400
X-MC-Unique: knRGfz32PUqnCNaYisudpQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2F966AF75;
	Wed, 28 Apr 2021 20:54:56 +0000 (UTC)
Message-ID: <3719d0b8ab39d1008030e8f4e462fb4ee98952ac.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 28 Apr 2021 22:54:55 +0200
In-Reply-To: <20210428195457.GA46518@lobo>
References: <20210422202130.30906-1-mwilck@suse.com>
	<20210428195457.GA46518@lobo>
User-Agent: Evolution 3.38.4
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
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13SKt6HY005141
X-loop: dm-devel@redhat.com
Cc: linux-scsi@vger.kernel.org, Daniel Wagner <dwagner@suse.de>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm: dm_blk_ioctl(): implement failover for SG_IO on
	dm-multipath
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-04-28 at 15:54 -0400, Mike Snitzer wrote:
>=20
> Ngh... not loving this at all.=A0=A0

I'm not surprised :-) I infer from your reply that you acknowledge this
is something that should be done one way or the other, and I'm glad
about that.

> But here is a patch (that I didn't
> compile test) that should be folded in, still have to think about how
> this could be made cleaner in general though.

Thanks, much appreciated.

> Also, dm_sg_io_ioctl should probably be in dm-rq.c (maybe even dm-
> mpath.c!?)
>=20
> From: Mike Snitzer <snitzer@redhat.com>
> Date: Wed, 28 Apr 2021 15:03:20 -0400
> Subject: [PATCH] dm: use scsi_result_to_blk_status rather than open-
> coding it
>=20
> Other small cleanups/nits.
>=20
> BUT the fact that dm.c now #includes <scsi/scsi.h> and <scsi/sg.h>
> leaves a very bitter taste.
>=20
> Also, hardcoding the issuing of a "fail_path" message (assumes tgt is
> dm-mpath) but still having checks like !tgt->type->message.. its all
> very contrived and awkward!

This I can explain. I need to check t->type->message because not all
targets define it. If I didn't, yet used message(), the kernel might
crash. I would have avoided the hard-coded "fail_path", too, if I had
found a way to figure out which messages a given target supports, or
whether the target in question is the multipath target in the first
place. But I couldn't figure it out. If it's possible, please tell me
how.=A0

Wrt "fail_path", the assumption is that other rq-based targets would
either not support "fail_path" and thus return an error, or implement
it with the same semantics as multipath. In both cases, my patch would
do the "right thing" (falling back to standard behavior in the error
case).

Thanks,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

