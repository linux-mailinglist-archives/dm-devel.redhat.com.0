Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AE67C17F0B3
	for <lists+dm-devel@lfdr.de>; Tue, 10 Mar 2020 07:40:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583822450;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=VoMgIiOmG9Oq0suksZGpXIykR8etFmhSowAClviu6f4=;
	b=Lx946iPGf930qAfQ0osDiz32qo5tQSykNGMJM9ojauSoRMTVWBO0iY2O/TwhSoStBVVEeT
	GLxaPFSBgNZDBec9bFkxrXMVMMy8rlXVUnszrhwiqaiDrlGyPyG+0vfA7X9lqUPOpOuvev
	VQ+45u8iKWoElPJ3o9UX0UhjmzZZxSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-07HTgQK9MRyk2sstHEd7gg-1; Tue, 10 Mar 2020 02:40:47 -0400
X-MC-Unique: 07HTgQK9MRyk2sstHEd7gg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E0A513F5;
	Tue, 10 Mar 2020 06:40:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64A729008F;
	Tue, 10 Mar 2020 06:40:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 895EA8449B;
	Tue, 10 Mar 2020 06:40:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02A6e6ds013090 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Mar 2020 02:40:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C37002166B31; Tue, 10 Mar 2020 06:40:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE7A82166B30
	for <dm-devel@redhat.com>; Tue, 10 Mar 2020 06:40:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D461800294
	for <dm-devel@redhat.com>; Tue, 10 Mar 2020 06:40:04 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-108-_Ms4rFBZPmyDuLukm82fvw-1; Tue, 10 Mar 2020 02:40:00 -0400
X-MC-Unique: _Ms4rFBZPmyDuLukm82fvw-1
Received: by mail-io1-f53.google.com with SMTP id w9so11663920iob.12
	for <dm-devel@redhat.com>; Mon, 09 Mar 2020 23:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=fpn3PtBgGJZ9UHO8w4JVDx160fcmryQCu2ozZdyPjp8=;
	b=PEUGg16stS7I+y2U9bzPvjoV4PARARbzCMzAmbrNe+2c6ldnAfCCyoPrgHmbUDwWBr
	JuodTUuGgBOLlmo1XqHWp9W6x2bi0X+y+lKsFaANN/GUuRNT3rJRu4UvUYZv7J888Ri9
	gRDU9JyXd23eWxm+aXol+5DWCcxbbqZsYhS622+54bt3tFm49fAicWFd6K0PvngeDxIg
	7ZFhWjIgSqwcJRg89n2lpSdrvK2Wdq8ppyh8lQnFDs0u0HvoDpbMZpmr1IYf/nKvr9cS
	d2S1z70T7aRpXjZ1NaGZGHk5FvHIOXR8/9CUNqB04KRqjwUO/veVfIBEdzP3BCqPjnow
	zw/A==
X-Gm-Message-State: ANhLgQ3gXSCxRgrzBCvEcez0RNL5uS+UBRDq/K9MWsaHlRlTLj1GySzc
	ccklewnS0ja8m5J+qG0nPlTbc+OstSZcU2NWPNHYI8mvXXk=
X-Google-Smtp-Source: ADFU+vsp0/aVpBX41lRxzXa2iAnlh8oGom6yMtIZoc317r5aoXQwtgTd62KUpjIUJ/wP8FMfbrE2BTSgrBwFk0hAtqk=
X-Received: by 2002:a5d:9c96:: with SMTP id p22mr11852507iop.70.1583822399617; 
	Mon, 09 Mar 2020 23:39:59 -0700 (PDT)
MIME-Version: 1.0
From: Drew Hastings <dhastings@crucialwebhost.com>
Date: Mon, 9 Mar 2020 23:39:49 -0700
Message-ID: <CAN-y+E+A+hNTF_v84N_gxM8MM1FiMZLbAQW4pZ=k-rHTAMZCnQ@mail.gmail.com>
To: dm-devel@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Subject: [dm-devel] Fix for dm-thin pool resizing
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
Content-Type: multipart/mixed; boundary="===============0171832888234930347=="

--===============0171832888234930347==
Content-Type: multipart/alternative; boundary="00000000000084563e05a07a6331"

--00000000000084563e05a07a6331
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Expanding the data device consumes metadata space. Right now the data
device is currently resized *before* the metadata device is. This creates a
situation where you can reload the pool with a much larger metadata device
and a larger data device, but it will fail the pool by running out of
metadata space trying to expand the data device.

I've been able to fix this by simply changing around the order that things
are checked. Rather than checking data device first, which might itself
require too much metadata to expand, just check the metadata device first
and expand that (allowing for the subsequent data device expansion).

static int pool_preresume(struct dm_target *ti)
{
    int r;
    bool need_commit;
    struct pool_c *pt =3D ti->private;
    struct pool *pool =3D pt->pool;

    /*
     * Take control of the pool object.
     */
    r =3D bind_control_target(pool, ti);
    if (r)
        return r;

    r =3D maybe_resize_metadata_dev(ti, &need_commit);
    if (r)
        return r;

    if(need_commit) (void) commit(pool);

    r =3D maybe_resize_data_dev(ti, &need_commit);
    if (r)
        return r;

    if(need_commit) (void) commit(pool);

    return 0;
}


Thanks for your hard work!
- Drew

--00000000000084563e05a07a6331
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Expanding the data device consumes metadata space. Ri=
ght now the data device is currently resized <i>before</i>=C2=A0the metadat=
a device is. This creates a situation where you can reload the pool with a =
much larger metadata device and a larger data device, but it will fail the =
pool by running out of metadata space trying to expand the data device.<br>=
<br></div><div>I&#39;ve been able to fix this by simply changing around the=
 order that things are checked. Rather than checking data device first, whi=
ch might itself require too much metadata to expand, just check the metadat=
a device first and expand that (allowing for the subsequent data device exp=
ansion).<br><br>static int pool_preresume(struct dm_target *ti)<br>{<br>=C2=
=A0 =C2=A0 int r;<br>=C2=A0 =C2=A0 bool need_commit;<br>=C2=A0 =C2=A0 struc=
t pool_c *pt =3D ti-&gt;private;<br>=C2=A0 =C2=A0 struct pool *pool =3D pt-=
&gt;pool;<br><br>=C2=A0 =C2=A0 /*<br>=C2=A0 =C2=A0 =C2=A0* Take control of =
the pool object.<br>=C2=A0 =C2=A0 =C2=A0*/<br>=C2=A0 =C2=A0 r =3D bind_cont=
rol_target(pool, ti);<br>=C2=A0 =C2=A0 if (r)<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return r;<br><br>=C2=A0 =C2=A0 r =3D maybe_resize_metadata_dev(ti, &amp=
;need_commit);<br>=C2=A0 =C2=A0 if (r)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n r;<br><br>=C2=A0 =C2=A0 if(need_commit) (void) commit(pool);<br><br>=C2=
=A0 =C2=A0 r =3D maybe_resize_data_dev(ti, &amp;need_commit);<br>=C2=A0 =C2=
=A0 if (r)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br><br>=C2=A0 =C2=A0 if=
(need_commit) (void) commit(pool);<br><br>=C2=A0 =C2=A0 return 0;<br>}<br><=
br><br>Thanks for your hard work!</div><div>- Drew</div></div>

--00000000000084563e05a07a6331--

--===============0171832888234930347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0171832888234930347==--

