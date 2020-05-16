Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E9B0D1D609B
	for <lists+dm-devel@lfdr.de>; Sat, 16 May 2020 13:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589630118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uKF9rSkZbyltiO/xSC6jvilCl4S9OXMZ32KszVoExC4=;
	b=MVUl6MprwT1+/KHRO6n5prENFl8RhIJwHyX9uqDu47xYBB/t/1Gcj2oYNPGkx0WcLWaEKy
	f2fawKYIKj+o38OxkfXS1hPH1wUQXZZUSdRFtyRgdOK4WvKtrhTwUXuPD3Wz4b+HDWpAHO
	0xrRDX0xQt3EmJkD59iWiBmeNRWVvkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-D2sq2cttPsOhXhtvdzTVkQ-1; Sat, 16 May 2020 07:55:16 -0400
X-MC-Unique: D2sq2cttPsOhXhtvdzTVkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A60958005AD;
	Sat, 16 May 2020 11:55:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD625C1D6;
	Sat, 16 May 2020 11:55:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A6114CAB0;
	Sat, 16 May 2020 11:55:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04GBr7Z6003948 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 16 May 2020 07:53:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2958200BCF6; Sat, 16 May 2020 11:53:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE3342026972
	for <dm-devel@redhat.com>; Sat, 16 May 2020 11:53:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61AFA1859160
	for <dm-devel@redhat.com>; Sat, 16 May 2020 11:53:05 +0000 (UTC)
Received: from m9a0014g.houston.softwaregrp.com
	(m9a0014g.houston.softwaregrp.com [15.124.64.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-380-69AKnjE8PT-eDzHbZnlXmw-1;
	Sat, 16 May 2020 07:53:00 -0400
X-MC-Unique: 69AKnjE8PT-eDzHbZnlXmw-1
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 16 May 2020 11:52:07 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 16 May 2020 11:51:29 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 16 May 2020 11:51:29 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB1836.namprd18.prod.outlook.com (2603:10b6:4:63::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26;
	Sat, 16 May 2020 11:51:28 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.3000.022;
	Sat, 16 May 2020 11:51:28 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 4/6] Unit tests for is_path_valid()
Thread-Index: AQHWKlyIPZxvoznOo0qxPEQVwpLYqKipnIqAgAD/ZQA=
Date: Sat, 16 May 2020 11:51:28 +0000
Message-ID: <068058f2f546c6ef2474d8a704097dfbb0be05b3.camel@suse.com>
References: <1589507962-6895-1-git-send-email-bmarzins@redhat.com>
	<1589507962-6895-5-git-send-email-bmarzins@redhat.com>
	<9b472a9cdcea88daf12e74733eb579e489daded5.camel@suse.com>
In-Reply-To: <9b472a9cdcea88daf12e74733eb579e489daded5.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1ece7d4-8411-4d3c-fb17-08d7f98f7817
x-ms-traffictypediagnostic: DM5PR1801MB1836:
x-microsoft-antispam-prvs: <DM5PR1801MB1836E25D4A0FA1D3B0E57C93FCBA0@DM5PR1801MB1836.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 040513D301
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zGQTFRk2ojut0z4Zs6/rImjZ9R75KhA2BSBgxoN2z/2DmVwNjSgnQPLcpNM8qz5Uluauk5G8Pp+j0nXfXjTV2Hhh4E4w45/qVdPWkZJPGNs9DuZqU5Jty2jvUoo0i32si877z0Q8nr5XnPNK29LEPGmYbvuXxg7M+0SUG/yqpIC2LGL8avzhsjK6DE+idoXkGC1CR12Zvm4TIj61BPqNqlxT+BNZWQU70B4qtTxyJlPdvUi3H15cM6PyP2CKICdr83T99c0XDdkwKXVAsJPt2T5RfgEQ3miiE5UMeHZKHV31yn7OwmqEd641jTU7xABXTsPClZ5OQHC0NZtLoCoKfGDq1ItLt/2QaFkPA9uWZyqlpwlej6YnF0cO/hfjAtRBBbb+oASQB/BwoZhwmI+fHufcmPfAkftCxehG6OAjhurGVY5Hm3+rYjbnLA179C0ZSgk9dR1W5uslUsWYi5Fu67AB4rut7yHhtyXhflPRbk/XOrax0nFYhXusHKjjAA6pJyYW4CSEjwdNAu4SPnbTRzOcNJETMtv9FObG6wEYt+0+ty/nJdpFGurA5yDx1Ahm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(6486002)(966005)(86362001)(66574014)(4326008)(2616005)(5660300002)(64756008)(66556008)(26005)(91956017)(76116006)(186003)(66446008)(66946007)(8676002)(8936002)(66476007)(36756003)(316002)(2906002)(71200400001)(110136005)(6506007)(6512007)(478600001)(2004002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 3QryMavFjWwqO1LrxolIV5OQdzaIJYOEEH1NQTblzBR6hkJb+szAbqwHIPHQ6TjYDriiRiWeTOaFTgOG02AwRFvf/iDfZAsubVww/kpmoIv8wM84yDcKj0pB8UPf53MiZ4O9v2u9wTYx+WCsNMpx6m7c/+LHTgKx39FxllFjQ+XTdETustwgQTPHo8GDwDBaYVavUB+d0+YccvW61UD8T/DEY7lVqfRS4NRQlPyt/1+OnbcAjoW50FkHr6UknCyI34E107aJHL0vQLSkPJE56g6zMa6LaB1Sbfkj2jfPN78w0zEPUsQFtAKDLZ0W7CuQ8PWfc3faiIBcUMgDHQbU5Pd+xCXO9G3I4/SyccMX/Z99drZIRc6jN+LdD0pG7ATIQQGqIphLdXZvl+dabYO+666FhOdT8t4MU6Nt75VV8yBmCsVrj6cfjmVrrjkobgr+JuqU7LA1CO9nTFfmdAAH1utlOnB7OqrFFu4ewh0frkbBB+gNDwt7VUhtJMF48PkP
x-ms-exchange-transport-forked: True
Content-ID: <C9B2C319B857D443B69558A1855D1872@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ece7d4-8411-4d3c-fb17-08d7f98f7817
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2020 11:51:28.5382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b+PpMQIXNrsgYFVY3FMAnStNANjyXlOmv0QglrUCs9MdIvrqTH1fyaFKQ05KnzsxOysWpcaFBWfwZ5PIsZc5xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1836
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04GBr7Z6003948
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/6] Unit tests for is_path_valid()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-05-15 at 22:37 +0200, Martin Wilck wrote:
> On Thu, 2020-05-14 at 20:59 -0500, Benjamin Marzinski wrote:
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
>=20
> Two minor nits below, otherwise ack.
>=20
> > ---
> >  tests/Makefile |   4 +-
> >  tests/valid.c  | 424
> > +++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 427 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/valid.c
> >=20
> > diff --git a/tests/Makefile b/tests/Makefile
> > index 1b8706a7..125553b8 100644
> > --- a/tests/Makefile
> > +++ b/tests/Makefile
> > @@ -13,7 +13,7 @@ CFLAGS +=3D $(BIN_CFLAGS) -I$(multipathdir)
> > -I$(mpathcmddir) \
> >  LIBDEPS +=3D -L$(multipathdir) -L$(mpathcmddir) -lmultipath
> > -lmpathcmd
> > -lcmocka
> > =20
> >  TESTS :=3D uevent parser util dmevents hwtable blacklist unaligned
> > vpd
> > pgpolicy \
> > -=09 alias directio
> > +=09 alias directio valid
> > =20
> >  .SILENT: $(TESTS:%=3D%.o)
> >  .PRECIOUS: $(TESTS:%=3D%-test)
> > @@ -50,6 +50,8 @@ vpd-test_OBJDEPS :=3D  ../libmultipath/discovery.o
> >  vpd-test_LIBDEPS :=3D -ludev -lpthread -ldl
> >  alias-test_TESTDEPS :=3D test-log.o
> >  alias-test_LIBDEPS :=3D -lpthread -ldl
> > +valid-test_OBJDEPS :=3D ../libmultipath/valid.o
> > +valid-test_LIBDEPS :=3D -ludev -lpthread -ldl
> >  ifneq ($(DIO_TEST_DEV),)
> >  directio-test_LIBDEPS :=3D -laio
> >  endif
> > diff --git a/tests/valid.c b/tests/valid.c
> > new file mode 100644
> > index 00000000..b128b029
> > --- /dev/null
> > +++ b/tests/valid.c
> > @@ -0,0 +1,424 @@
> > +/*
> > + * Copyright (c) 2020 Benjamin Marzinski, Redhat
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version 2
> > + * of the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public
> > License
> > + * along with this program.  If not, see <
> > https://www.gnu.org/licenses/>;;.
> > + *
> > + */
> > +
> > +#define _GNU_SOURCE
> > +#include <stdint.h>
> > +#include <stdbool.h>
> > +#include <stdarg.h>
> > +#include <stddef.h>
> > +#include <setjmp.h>
> > +#include <stdlib.h>
> > +#include <errno.h>
> > +#include <cmocka.h>
> > +#include "globals.c"
> > +#include "util.h"
> > +#include "discovery.h"
> > +#include "wwids.h"
> > +#include "valid.h"
> > +
> > +int test_fd;
> > +struct udev_device {
> > +=09int unused;
> > +} test_udev;
> > +
> > +bool __wrap_sysfs_is_multipathed(struct path *pp, bool set_wwid)
> > +{
> > +=09bool is_multipathed =3D mock_type(bool);
> > +=09assert_non_null(pp);

One general remark, just occured to me as I was looking at cmocka for a
different project: Perhaps we should rather use cmockas's
check_expected() functionality for testing parameter validity than the
assert...() macros.

We haven't done this consequently so far, but we could try to improve.

Regards
Martin


--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

