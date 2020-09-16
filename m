Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9819126C396
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 16:20:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-RDv39tgkOEuH0wj31Fz5IA-1; Wed, 16 Sep 2020 10:20:22 -0400
X-MC-Unique: RDv39tgkOEuH0wj31Fz5IA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46041109F004;
	Wed, 16 Sep 2020 14:19:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 373F5100164C;
	Wed, 16 Sep 2020 14:19:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85B61183D02D;
	Wed, 16 Sep 2020 14:19:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GEIx2b013811 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 10:18:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 543D2F559A; Wed, 16 Sep 2020 14:18:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D7DAF5590
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 14:18:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 384B185828E
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 14:18:57 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-515-cZMROhKAP3yg7pnnJ_gzyA-1;
	Wed, 16 Sep 2020 10:18:54 -0400
X-MC-Unique: cZMROhKAP3yg7pnnJ_gzyA-1
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-6-vUE3N_5kMN2xEaUsC0fckg-1; Wed, 16 Sep 2020 16:18:52 +0200
X-MC-Unique: vUE3N_5kMN2xEaUsC0fckg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB5579.eurprd04.prod.outlook.com (2603:10a6:10:80::32) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13;
	Wed, 16 Sep 2020 14:18:49 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a%7]) with mapi id 15.20.3391.014;
	Wed, 16 Sep 2020 14:18:49 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 1/3] multipath: add libmpathvalid library
Thread-Index: AQHWi6mHZ16Z9nyl9Eu3JKZ8ynuaHalrUUMA
Date: Wed, 16 Sep 2020 14:18:49 +0000
Message-ID: <940b5f7e1202f27a55f58417314c45e441679535.camel@suse.com>
References: <1600206312-6497-1-git-send-email-bmarzins@redhat.com>
	<1600206312-6497-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1600206312-6497-2-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63b06a53-10a3-4c89-308e-08d85a4b6e7d
x-ms-traffictypediagnostic: DB7PR04MB5579:
x-microsoft-antispam-prvs: <DB7PR04MB5579A7D2ABB179D2FB90933DFC210@DB7PR04MB5579.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x8GXSF39fo6yR41Rx8ofq2XU4dodRcJm0VSKg64ibKy/nA/1lLq7DZ2VzYLFYB43jrFh0P/mQqtblEgQ+F227q9fgb+FkxRpUF9frzfl4LsWpYFbTeuz9gn0MAgTEAMThTCmpag3bdl4WszzvXzB9fx4ZPAz9GxYZ698ETXU32KT1z7gnYW2Mna6ExamePtB8uKs8sGYWOAFBil3aS8j9gM3NyOkuFH1Ey2IsNyitQ6olcv+AVsS53Mz5HhYhDtYVtvRbzkaqz0xO3vSnktNXob6Sl7GtP6xDdonURFRq6CMNtF7DaqPYsAC1ND7ojAhSDPJw9zkgdMIpVAqVoXG+gDJlrIk6c4aCh8QK3GW+jwucfqjslUoiVf+uM3o/IckcYXDgxFAX2eFGfO0gYV4yPcqSzqJUj4ROd0qC+x2A5Q2HhMKzHWI62AEzg5riNEyVjQ0p8JVWBjH7LZu+CIulDysWou3A3YKJbjRfLmHzfu3CzjumT2XQHhme4SitV62
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(346002)(376002)(396003)(39860400002)(136003)(5660300002)(4326008)(2906002)(8676002)(86362001)(6506007)(26005)(186003)(110136005)(83380400001)(6512007)(66476007)(66446008)(91956017)(966005)(64756008)(66556008)(36756003)(66946007)(76116006)(478600001)(71200400001)(44832011)(6486002)(2616005)(316002)(8936002)(2004002);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: yTiCQeovUWYvPNTeTLHFI5vimeV7Ec7U/A30/6L2HRaVnp+rRIhXH3WA+f0rZV7TqP0Q6gjKdGE4Y46nHcK0S7gkaWxSJU6hLdfybpAra4qMNKU03vGegUaN19SxIHT5/ajstPIWZ/HrSvdwBonnrVePlge/uixUp/Thqz9xOwJVDIMuaeNJcGkLons28+6olGHQOdRpcyl0e1dzWWM8nAo6xXYYimZPMsWedNGfmo0oq6+MHq7J9Bvhcy2P8OulUJY3ZMz1A6aCT3QNVFia4sZSYAkrFb+XdNKGRq4OvL3pcCi+0yhFTGlxTApJpmjhG7XvocVOd75ig7tPzQuvQmkNbZuQ2kh9sswQi9+zxz4xD6dWYwigFAamY+1t8svdgR6+28ugqgvxVlP5X7EuIFBAR8DYSwkHtDsEMMbh7/qTOkqf4U7nEJ1Dd/JkkogbuWt4994n+UxK7P9sOOYehwUQUMxozFi1nRNya4uZI6GcjjzQ0+PUeJdPhhDjGA0wDCYPKQ81t/xoefOxAFGy6LEvHnTpzJtECP0YVduQlSlpAid9w3XrkpZsIelqiD5HTi5dwrI5GeNULKVYPD6zER8/RsmG+b62BYCm5bJe/nUApcT6WZdcQuIHvfqdrXm2RWYjOvt9Q8ib0eVFp2Mr0g==
x-ms-exchange-transport-forked: True
Content-ID: <E5EC8554B565D349939EF34577062C70@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b06a53-10a3-4c89-308e-08d85a4b6e7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 14:18:49.3791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zw8INI66fFKy3uwNHD51a8T1g50H6MOV7apwX+6UNnsUPK5PBUIM6iokbop6H1W3fMwBKsap/Dk2EmTeqffnoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5579
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GEIx2b013811
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3] multipath: add libmpathvalid library
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On Tue, 2020-09-15 at 16:45 -0500, Benjamin Marzinski wrote:
> This library allows other programs to check if a path should be
> claimed
> by multipath. It exports an init and exit function, a pointer to a
> struct config, that stores the configuration which is dealt with in
> the
> init and exit functions, and two more functions.
> 
> mpath_get_mode() get the configured find_multipaths mode.
> mpath_is_path() returns whether the device is claimed by multipath,
> and
> optionally returns the wwid.  This code works slightly different than
> the multipath -c/u code for SMART mode.  Instead of checking all the
> existing paths to see if another has the same wwid, it expects the
> caller to pass in an array of the already known path wwids, and
> checks
> if the current path matches any of those.
> 
> The library also doesn't set up the device-mapper log fuctions. It
> leaves this up to the caller.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  Makefile                            |   3 +-
>  libmpathvalid/Makefile              |  38 +++++++
>  libmpathvalid/libmpathvalid.version |  10 ++
>  libmpathvalid/mpath_valid.c         | 168
> ++++++++++++++++++++++++++++
>  libmpathvalid/mpath_valid.h         |  57 ++++++++++
>  5 files changed, 275 insertions(+), 1 deletion(-)
>  create mode 100644 libmpathvalid/Makefile
>  create mode 100644 libmpathvalid/libmpathvalid.version
>  create mode 100644 libmpathvalid/mpath_valid.c
>  create mode 100644 libmpathvalid/mpath_valid.h
> 
> diff --git a/Makefile b/Makefile
> index 4a3491da..f127ff91 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -9,6 +9,7 @@ BUILDDIRS := \
>  	libmultipath/checkers \
>  	libmultipath/foreign \
>  	libmpathpersist \
> +	libmpathvalid \
>  	multipath \
>  	multipathd \
>  	mpathpersist \
> @@ -29,7 +30,7 @@ $(BUILDDIRS):
>  	$(MAKE) -C $@
>  
>  libmultipath libdmmp: libmpathcmd
> -libmpathpersist multipath multipathd: libmultipath
> +libmpathpersist libmpathvalid multipath multipathd: libmultipath
>  mpathpersist multipathd:  libmpathpersist
>  
>  libmultipath/checkers.install \
> diff --git a/libmpathvalid/Makefile b/libmpathvalid/Makefile
> new file mode 100644
> index 00000000..70b97eca
> --- /dev/null
> +++ b/libmpathvalid/Makefile
> @@ -0,0 +1,38 @@
> +include ../Makefile.inc
> +
> +SONAME = 0
> +DEVLIB = libmpathvalid.so
> +LIBS = $(DEVLIB).$(SONAME)
> +
> +CFLAGS += $(LIB_CFLAGS) -I$(multipathdir) -I$(mpathcmddir)
> +
> +LIBDEPS += -lpthread -ldevmapper -ldl -L$(multipathdir) \
> +	   -lmultipath -L$(mpathcmddir) -lmpathcmd -ludev
> +
> +OBJS = mpath_valid.o
> +
> +all: $(LIBS)
> +
> +$(LIBS): $(OBJS)
> +	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS)
> $(LIBDEPS) -Wl,--version-script=libmpathvalid.version
> +	$(LN) $(LIBS) $(DEVLIB)
> +
> +install: $(LIBS)
> +	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(syslibdir)
> +	$(INSTALL_PROGRAM) -m 755 $(LIBS)
> $(DESTDIR)$(syslibdir)/$(LIBS)
> +	$(LN) $(LIBS) $(DESTDIR)$(syslibdir)/$(DEVLIB)
> +	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(includedir)
> +	$(INSTALL_PROGRAM) -m 644 mpath_valid.h $(DESTDIR)$(includedir)
> +
> +uninstall:
> +	$(RM) $(DESTDIR)$(syslibdir)/$(LIBS)
> +	$(RM) $(DESTDIR)$(syslibdir)/$(DEVLIB)
> +	$(RM) $(DESTDIR)$(includedir)/mpath_valid.h
> +
> +clean: dep_clean
> +	$(RM) core *.a *.o *.so *.so.* *.gz
> +
> +include $(wildcard $(OBJS:.o=.d))
> +
> +dep_clean:
> +	$(RM) $(OBJS:.o=.d)
> diff --git a/libmpathvalid/libmpathvalid.version
> b/libmpathvalid/libmpathvalid.version
> new file mode 100644
> index 00000000..4d8a8ba4
> --- /dev/null
> +++ b/libmpathvalid/libmpathvalid.version
> @@ -0,0 +1,10 @@
> +MPATH_1.0 {
> +	global:
> +		mpathvalid_conf;
> +		mpathvalid_init;
> +		mpathvalid_exit;
> +		mpathvalid_is_path;
> +		mpathvalid_get_mode;
> +	local:
> +		*;
> +};
> diff --git a/libmpathvalid/mpath_valid.c
> b/libmpathvalid/mpath_valid.c
> new file mode 100644
> index 00000000..6153e8b7
> --- /dev/null
> +++ b/libmpathvalid/mpath_valid.c
> @@ -0,0 +1,168 @@
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <libdevmapper.h>
> +#include <libudev.h>
> +#include <errno.h>
> +
> +#include "devmapper.h"
> +#include "structs.h"
> +#include "util.h"
> +#include "config.h"
> +#include "discovery.h"
> +#include "wwids.h"
> +#include "sysfs.h"
> +#include "mpath_cmd.h"
> +#include "valid.h"
> +#include "mpath_valid.h"
> +
> +static struct config default_config = { .verbosity = -1 };
> +struct config *mpathvalid_conf = &default_config;
> +
> +static unsigned int get_conf_mode(struct config *conf)
> +{
> +	if (conf->find_multipaths == FIND_MULTIPATHS_SMART)
> +		return MPATH_SMART;
> +	if (conf->find_multipaths == FIND_MULTIPATHS_GREEDY)
> +		return MPATH_GREEDY;
> +	return MPATH_STRICT;
> +}
> +
> +static void set_conf_mode(struct config *conf, unsigned int mode)
> +{
> +	if (mode == MPATH_SMART)
> +		conf->find_multipaths = FIND_MULTIPATHS_SMART;
> +	else if (mode == MPATH_GREEDY)
> +		conf->find_multipaths = FIND_MULTIPATHS_GREEDY;
> +	else
> +		conf->find_multipaths = FIND_MULTIPATHS_STRICT;
> +}
> +
> +unsigned int mpathvalid_get_mode(void)
> +{
> +	int mode;
> +	struct config *conf;
> +
> +	conf = get_multipath_config();
> +	if (!conf)
> +		return -1;
> +	mode = get_conf_mode(conf);
> +	put_multipath_config(conf);
> +	return mode;
> +}
> +
> +static int convert_result(int result) {
> +	switch (result) {
> +	case PATH_IS_ERROR:
> +		return MPATH_IS_ERROR;
> +	case PATH_IS_NOT_VALID:
> +		return MPATH_IS_NOT_VALID;
> +	case PATH_IS_VALID:
> +		return MPATH_IS_VALID;
> +	case PATH_IS_VALID_NO_CHECK:
> +		return MPATH_IS_VALID_NO_CHECK;
> +	case PATH_IS_MAYBE_VALID:
> +		return MPATH_IS_MAYBE_VALID;
> +	}
> +	return MPATH_IS_ERROR;
> +}
> +
> +int
> +mpathvalid_init(int verbosity)
> +{
> +	unsigned int version[3];
> +	struct config *conf;
> +
> +	default_config.verbosity = verbosity;
> +	skip_libmp_dm_init();
> +	conf = load_config(DEFAULT_CONFIGFILE);
> +	if (!conf)
> +		return -1;
> +	conf->verbosity = verbosity;
> +	if (dm_prereq(version))
> +		goto fail;
> +	memcpy(conf->version, version, sizeof(version));
> +
> +	mpathvalid_conf = conf;
> +	return 0;
> +fail:
> +	free_config(conf);
> +	return -1;
> +}
> +
> +int
> +mpathvalid_exit(void)
> +{
> +	struct config *conf = mpathvalid_conf;
> +
> +	default_config.verbosity = -1;
> +	if (mpathvalid_conf == &default_config)
> +		return 0;
> +	mpathvalid_conf = &default_config;
> +	free_config(conf);
> +	return 0;
> +}
> +
> +/*
> + * name: name of path to check
> + * mode: mode to use for determination. MPATH_DEFAULT uses
> configured mode
> + * info: on success, contains the path wwid
> + * paths: array of the returned mpath_info from other claimed paths
> + * nr_paths: the size of the paths array
> + */
> +int
> +mpathvalid_is_path(const char *name, unsigned int mode, char **wwid,
> +	           const char **path_wwids, unsigned int nr_paths)
> +{
> +	struct config *conf;
> +	int r = MPATH_IS_ERROR;
> +	unsigned int i;
> +	struct path *pp;
> +
> +	if (!name || mode >= MPATH_MAX_MODE)
> +		return r;
> +
> +	if (nr_paths > 0 && !path_wwids)
> +		return r;
> +
> +	pp = alloc_path();
> +	if (!pp)
> +		return r;
> +
> +	if (wwid) {
> +		*wwid = (char *)malloc(WWID_SIZE);
> +		if (!*wwid)
> +			goto out;
> +	}
> +
> +	conf = get_multipath_config();
> +	if (!conf || conf == &default_config)
> +		goto out_wwid;
> +	if (mode != MPATH_DEFAULT)
> +		set_conf_mode(conf, mode);
> +	r = convert_result(is_path_valid(name, conf, pp, true));
> +	put_multipath_config(conf);
> +
> +	if (r == MPATH_IS_MAYBE_VALID) {
> +		for (i = 0; i < nr_paths; i++) {
> +			if (strncmp(path_wwids[i], pp->wwid, WWID_SIZE)
> == 0) {
> +				r = MPATH_IS_VALID;
> +				break;
> +			}
> +		}
> +	}
> +
> +out_wwid:
> +	if (wwid) {
> +		if (r == MPATH_IS_VALID || r == MPATH_IS_VALID_NO_CHECK
> ||
> +		    r == MPATH_IS_MAYBE_VALID)
> +			strlcpy(*wwid, pp->wwid, WWID_SIZE);
> +		else {
> +			free(*wwid);
> +			*wwid = NULL;
> +		}
> +	}
> +out:
> +	free_path(pp);
> +	return r;
> +}
> diff --git a/libmpathvalid/mpath_valid.h
> b/libmpathvalid/mpath_valid.h
> new file mode 100644
> index 00000000..7fd8aa47
> --- /dev/null
> +++ b/libmpathvalid/mpath_valid.h
> @@ -0,0 +1,57 @@
> +/*
> + * Copyright (C) 2015 Red Hat, Inc.
> + *
> + * This file is part of the device-mapper multipath userspace tools.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> License
> + * along with this program.  If not, see <
> http://www.gnu.org/licenses/>;.
> + */
> +
> +#ifndef LIB_MPATH_VALID_H
> +#define LIB_MPATH_VALID_H
> +
> +#ifdef __cpluscplus
> +extern "C" {
> +#endif
> +
> +enum mpath_valid_mode {
> +	MPATH_DEFAULT,
> +	MPATH_STRICT,
> +	MPATH_SMART,
> +	MPATH_GREEDY,
> +	MPATH_MAX_MODE,  /* used only for bounds checking */
> +};
> +
> +/* MPATH_IS_VALID_NO_CHECK is used to skip checks to see if the
> device
> + * has already been unclaimed by multipath in the past */
> +enum mpath_valid_result {
> +	MPATH_IS_ERROR = -1,
> +	MPATH_IS_NOT_VALID,
> +	MPATH_IS_VALID,
> +	MPATH_IS_VALID_NO_CHECK,
> +	MPATH_IS_MAYBE_VALID,
> +};
> +
> +struct config;
> +extern struct config *mpathvalid_conf;

What do you need this for?

This looks good to me. It would be even better with a few unit
tests...

Anyway, I've been working on a patch set to spare callers to define
the symbols {get,put}_multipath_config, udev, and logsink (we've been
discussing that in the past). I'm going to submit it soon. I think you
might be interested in that for this new library.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

