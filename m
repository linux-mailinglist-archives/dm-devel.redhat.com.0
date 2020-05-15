Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CB03D1D5ABB
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 22:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589575083;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hD8QEsvLLL+g5TAIOOEVqbODuBftFsqkwNJve7ouiVo=;
	b=K6791QwY1ttOIbWcYDlGCRnMVuUQWfw9le4WOtZXHx9YF9rNXmkPCN2BKngF2QkFSeOY+q
	sURkhzyitScgPuXeZDDJJ0MbPDImNwNWFUqUqhdhGiB7+j5uT6VN6aspPuVg3k1O3n0k44
	eZMLs1HywCVUhlWP61juq+0vOJIL2q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247--brnbbqVNnKvh1ad2X7jRw-1; Fri, 15 May 2020 16:38:01 -0400
X-MC-Unique: -brnbbqVNnKvh1ad2X7jRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C887B460;
	Fri, 15 May 2020 20:37:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB8EE7D973;
	Fri, 15 May 2020 20:37:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3512D4E9FB;
	Fri, 15 May 2020 20:37:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04FKbFtE007604 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 16:37:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C13710913B4; Fri, 15 May 2020 20:37:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1E811083078
	for <dm-devel@redhat.com>; Fri, 15 May 2020 20:37:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A35B8A19FA
	for <dm-devel@redhat.com>; Fri, 15 May 2020 20:37:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-10-BI5KGHttPAGL89q-rxzVjg-1;
	Fri, 15 May 2020 16:37:05 -0400
X-MC-Unique: BI5KGHttPAGL89q-rxzVjg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C6AEBABD1;
	Fri, 15 May 2020 20:37:06 +0000 (UTC)
Message-ID: <126a59ed3668d8992ea8a2565de212c13edfcde2.camel@suse.com>
From: Martin Wilck <martin.wilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
In-Reply-To: <1589507962-6895-3-git-send-email-bmarzins@redhat.com>
References: <1589507962-6895-1-git-send-email-bmarzins@redhat.com>
	<1589507962-6895-3-git-send-email-bmarzins@redhat.com>
MIME-Version: 1.0
Date: Fri, 15 May 2020 22:36:57 +0200
User-Agent: Evolution 3.36.2
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04FKbFtE007604
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/6] libmultipath: make sysfs_is_multipathed
 able to return wwid
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-05-14 at 20:59 -0500, Benjamin Marzinski wrote:
> sysfs_is_multipathed reads the wwid of the dm device holding a path
> to
> check if its a multipath device.  Add code to optinally set pp->wwid
> to
> that wwid.  This will be used by a future patch.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

