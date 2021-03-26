Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 52A4734AC9E
	for <lists+dm-devel@lfdr.de>; Fri, 26 Mar 2021 17:36:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-gFpyyQJdN9m_ki2q6iTjZQ-1; Fri, 26 Mar 2021 12:36:31 -0400
X-MC-Unique: gFpyyQJdN9m_ki2q6iTjZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 848768749BC;
	Fri, 26 Mar 2021 16:36:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFE45138E8;
	Fri, 26 Mar 2021 16:36:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11C4C1809C83;
	Fri, 26 Mar 2021 16:36:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12QGaHG2001431 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 12:36:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A82C52026D07; Fri, 26 Mar 2021 16:36:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A05B02026D48
	for <dm-devel@redhat.com>; Fri, 26 Mar 2021 16:36:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB07F805B3B
	for <dm-devel@redhat.com>; Fri, 26 Mar 2021 16:36:14 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-377-gFrIBb5VNdS1LT5I5h4g5Q-1;
	Fri, 26 Mar 2021 12:36:12 -0400
X-MC-Unique: gFrIBb5VNdS1LT5I5h4g5Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 00AC2AD8D;
	Fri, 26 Mar 2021 16:36:10 +0000 (UTC)
Message-ID: <f8a43dd00248218c96bd2cc06fb31c5aa41223f1.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Date: Fri, 26 Mar 2021 17:36:10 +0100
In-Reply-To: <20210325223414.5185-1-xose.vazquez@gmail.com>
References: <20210325223414.5185-1-xose.vazquez@gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12QGaHG2001431
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/2] multipath-tools: add more ALUA info to
	docs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-03-25 at 23:34 +0100, Xose Vazquez Perez wrote:
> Xose Vazquez Perez (2):
> =A0 multipath-tools: add info about how to enable ALUA in Huawei
> OceanStor arrays
> =A0 multipath-tools: add more info about ALUA for CLARiiON arrays
>=20
> =A0README.alua | 5 ++++-
> =A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> Cc: Martin Wilck <mwilck@suse.com>
> Cc: Benjamin Marzinski <bmarzins@redhat.com>
> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

> ---
> BTW, some "new" generations of fully symmetrical Active-Active arrays
> support ALUA
> (by default ???), but in the multipath-tools hwtable they are defined
> as "multibus":
> - IBM DS8000, since ???
> - IBM XIV, since Gen2 with microcode 10.2.1
> - EMC SYMMETRIX, since VMAX 3 with HYPERMAX OS 5977.811.784

Almost every (SCSI) array I've seen lately supports ALUA (even though
some seem to interpret the standard quite freely).

In general, we rely on the vendors for these matters. But if you have
reliable information, I support changing this to "group_by_prio".=20

Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

