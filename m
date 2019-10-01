Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D8C41CE
	for <lists+dm-devel@lfdr.de>; Tue,  1 Oct 2019 22:31:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 676CB2543;
	Tue,  1 Oct 2019 20:31:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85ED360BE0;
	Tue,  1 Oct 2019 20:31:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FEA24EE68;
	Tue,  1 Oct 2019 20:30:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x91KUjXd018492 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 16:30:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 989635D717; Tue,  1 Oct 2019 20:30:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24C285D6D0;
	Tue,  1 Oct 2019 20:30:43 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
	[217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44D5D8A2195;
	Tue,  1 Oct 2019 20:30:39 +0000 (UTC)
X-Originating-IP: 209.85.166.47
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47]) (Authenticated sender: gmail@opensvc.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 32D9B20006;
	Tue,  1 Oct 2019 20:30:37 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id v2so51407239iob.10;
	Tue, 01 Oct 2019 13:30:36 -0700 (PDT)
X-Gm-Message-State: APjAAAVzMgwBNL2mAkx/2P6Ktfz+4szB/xNJHDaT+AWOS2MTenE2QTd9
	m8xne8gZRAKYa9eXc5isPKqlRZWmuNWtYmSWkpI=
X-Google-Smtp-Source: APXvYqwN6Z/V0J1huwrI5JNeb5b0N8c6yglI5jpYyZ/gD8GOsS3wz2M9FMXvxj7U788cwPYomB653JfS4XZKtkHLYGk=
X-Received: by 2002:a92:5e0b:: with SMTP id s11mr28873480ilb.26.1569961835728; 
	Tue, 01 Oct 2019 13:30:35 -0700 (PDT)
MIME-Version: 1.0
From: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 1 Oct 2019 22:30:24 +0200
X-Gmail-Original-Message-ID: <CABr-Gncq_wj6iv7knLFLU-oEMBXtP2oPfOjUFUNMMRC6Q_F12g@mail.gmail.com>
Message-ID: <CABr-Gncq_wj6iv7knLFLU-oEMBXtP2oPfOjUFUNMMRC6Q_F12g@mail.gmail.com>
To: petr.vorel@gmail.com, Martin Wilck <Martin.Wilck@suse.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, Chongyun Wu <wu.chongyun@h3c.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.69]); Tue, 01 Oct 2019 20:30:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Tue, 01 Oct 2019 20:30:42 +0000 (UTC) for IP:'217.70.183.200'
	DOMAIN:'relay7-d.mail.gandi.net' HELO:'relay7-d.mail.gandi.net'
	FROM:'christophe.varoqui@opensvc.com' RCPT:''
X-RedHat-Spam-Score: -0.699  (HTML_MESSAGE, RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 217.70.183.200 relay7-d.mail.gandi.net
	217.70.183.200 relay7-d.mail.gandi.net
	<christophe.varoqui@opensvc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: [dm-devel] [multipath-tools] merges
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
Content-Type: multipart/mixed; boundary="===============8502878492485126767=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Tue, 01 Oct 2019 20:31:15 +0000 (UTC)

--===============8502878492485126767==
Content-Type: multipart/alternative; boundary="0000000000008799370593df3900"

--0000000000008799370593df3900
Content-Type: text/plain; charset="UTF-8"

Hi,

I merged the patchsets posted and reviewed in past months.

Here are the remaining sets needing rebase:

* Martin's "enable_foreign" patchset from aug 15
* Chongyun's "san_path_err" optimization patchset from aug 27

I'll bump the version after merging these missing patchs.

Petr, do you intent to submit a v2 of the s/daddr_t/__kernel_daddr_t/ patch
posted jul 08, following Christoph H's comment ... or is the posted version
fit for inclusion ?

Thanks,
Christophe

--0000000000008799370593df3900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I merged the patchsets posted and r=
eviewed in past months.</div><div><br></div><div>Here are the remaining set=
s needing rebase:</div><div><br></div><div>* Martin&#39;s &quot;enable_fore=
ign&quot; patchset from aug 15</div><div>* Chongyun&#39;s &quot;san_path_er=
r&quot; optimization patchset from aug 27</div><div><br></div><div>I&#39;ll=
 bump the version after merging these missing patchs.</div><div><br></div><=
div>Petr, do you intent to submit a v2 of the s/daddr_t/__kernel_daddr_t/ p=
atch posted jul 08, following Christoph H&#39;s comment ... or is the poste=
d version fit for inclusion ?</div><div><br></div><div>Thanks,</div><div>Ch=
ristophe</div></div>

--0000000000008799370593df3900--


--===============8502878492485126767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============8502878492485126767==--

